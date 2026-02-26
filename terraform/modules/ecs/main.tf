#########################
# ECS Cluster
#########################
resource "aws_ecs_cluster" "this" {
  name = "${var.project_name}-cluster"
}

#########################
# CloudWatch Log Group
#########################
resource "aws_cloudwatch_log_group" "ecs" {
  name              = var.log_group_name
  retention_in_days = 14
}

#########################
# ECS Task Definition
#########################
resource "aws_ecs_task_definition" "this" {
  family                   = "${var.project_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  execution_role_arn = "arn:aws:iam::373317459749:role/ecs_fargate_taskrole"

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "373317459749.dkr.ecr.us-east-1.amazonaws.com/ahmad-strapi-bluegreen:latest"
      cpu       = 512
      memory    = 1024
      essential = true

      portMappings = [
        {
          containerPort = 1337
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "DB_HOST",     value = var.db_host },
        { name = "DB_USERNAME", value = var.db_username },
        { name = "DB_PASSWORD", value = var.db_password }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = var.log_group_name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

#########################
# ECS Service
#########################
resource "aws_ecs_service" "this" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  # CodeDeploy Blue/Green deployment support
  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets          = var.private_subnets
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.blue_tg_arn
    container_name   = "app"
    container_port   = 1337
  }

  depends_on = [
    var.blue_tg_arn
  ]
}

#########################
# ECS Execution Role CloudWatch Policy
#########################
resource "aws_iam_policy" "ecs_logs_policy" {
  name        = "${var.project_name}-ecs-logs"
  description = "Allow ECS tasks to push logs to CloudWatch"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_logs_attach" {
  role       = "ecs_fargate_taskrole"
  policy_arn = aws_iam_policy.ecs_logs_policy.arn
}