variable "project_name" {
  description = "Project name prefix for ECS resources"
  type        = string
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "blue_tg_arn" {
  description = "Target group ARN for blue deployment"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group name for ECS logs"
  type        = string
}

variable "aws_region" {
  description = "AWS region for ECS and CloudWatch"
  type        = string
}