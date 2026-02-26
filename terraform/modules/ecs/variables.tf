#########################
# AWS & Project Settings
#########################

variable "aws_region" {
  description = "AWS region for ECS, ECR, and CloudWatch"
  type        = string
}

variable "project_name" {
  description = "Name of the project to prefix ECS cluster, tasks, and services"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group name for ECS logs"
  type        = string
}

#########################
# Database Settings
#########################

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive = true
}

variable "database_client" {
  description = "Database client type (postgres, mysql, etc.)"
  type        = string
}

variable "database_port" {
  description = "Database port for Strapi"
  type        = string
}

variable "database_name" {
  description = "Database name"
  type        = string
}

#########################
# ECS Networking
#########################

variable "private_subnets" {
  description = "List of private subnet IDs for ECS Fargate service"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "blue_tg_arn" {
  description = "ARN of the blue target group for the ECS service"
  type        = string
}

#########################
# Strapi Secrets
#########################

variable "app_keys" {
  description = "APP_KEYS for Strapi"
  type        = string
  sensitive   = true
}

variable "api_token_salt" {
  description = "API_TOKEN_SALT for Strapi"
  type        = string
  sensitive   = true
}

variable "admin_jwt_secret" {
  description = "ADMIN_JWT_SECRET for Strapi"
  type        = string
  sensitive   = true
}

variable "transfer_token_salt" {
  description = "TRANSFER_TOKEN_SALT for Strapi"
  type        = string
  sensitive   = true
}

variable "encryption_key" {
  description = "ENCRYPTION_KEY for Strapi"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT_SECRET for Strapi"
  type        = string
  sensitive   = true
}