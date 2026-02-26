variable "project_name" {
  type = string
}

variable "db_host" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "private_subnets" {
  type = list(string)
}

variable "ecs_sg_id" {
  type = string
}

variable "blue_tg_arn" {
  type = string
}

variable "log_group_name" {
  description = "CloudWatch log group name for ECS logs"
  type        = string
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}