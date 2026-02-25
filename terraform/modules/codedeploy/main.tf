#########################
# CodeDeploy Application
#########################
resource "aws_codedeploy_app" "this" {
  name             = "ahmad-strapi-codedeploy-app"
  compute_platform = "ECS"
}

#########################
# CodeDeploy Deployment Group
#########################
resource "aws_codedeploy_deployment_group" "this" {
  app_name              = aws_codedeploy_app.this.name
  deployment_group_name = "strapi-deployment-group"
  service_role_arn      = "arn:aws:iam::373317459749:role/codedeploy_role"

  deployment_config_name = "CodeDeployDefault.ECSCanary10Percent5Minutes"

  deployment_style {
    deployment_type   = "BLUE_GREEN"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  ecs_service {
    cluster_name = var.cluster_name
    service_name = var.service_name
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [var.listener_arn]
      }

      target_group {
        name = var.blue_tg_name
      }

      target_group {
        name = var.green_tg_name
      }
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }
  }

  # Optional: explicitly point to revision in S3
  revision {
    revision_type = "S3"
    s3_location {
      bucket      = "ahmad-task-10"
      key         = "appspec.json"
      bundle_type = "JSON"
    }
  }
}

#########################
# IAM Policy for S3 access
#########################
resource "aws_iam_role_policy" "codedeploy_s3_access" {
  name = "codedeploy-s3-access"
  role = "codedeploy_role"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::ahmad-task-10",
          "arn:aws:s3:::ahmad-task-10/*"
        ]
      }
    ]
  })
}