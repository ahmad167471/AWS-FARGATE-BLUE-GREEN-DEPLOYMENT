variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "ahmad-bluegreen"
}

variable "db_username" {
  description = "RDS PostgreSQL username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "RDS PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "db_host" {
  description = "RDS endpoint"
  type        = string
}

variable "database_name" {
  description = "Database name for Strapi"
  type        = string
}

variable "database_username" {
  description = "Database username for Strapi"
  type        = string
}

variable "database_password" {
  description = "Database password for Strapi"
  type        = string
  sensitive   = true
}

variable "database_port" {
  description = "Database port for Strapi"
  type        = number
  default     = 5432
}

variable "database_client" {
  description = "Database client for Strapi (postgres/mysql/sqlite)"
  type        = string
  default     = "postgres"
}

variable "app_keys" {
  description = "Strapi app keys"
  type        = string
}

variable "api_token_salt" {
  description = "Strapi API token salt"
  type        = string
}

variable "admin_jwt_secret" {
  description = "Strapi admin JWT secret"
  type        = string
}

variable "transfer_token_salt" {
  description = "Strapi transfer token salt"
  type        = string
}

variable "encryption_key" {
  description = "Strapi encryption key"
  type        = string
}

variable "jwt_secret" {
  description = "Strapi JWT secret"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for ECS tasks"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security Group ID for ECS tasks"
  type        = string
}

variable "blue_tg_arn" {
  description = "ARN of the blue target group"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group name for ECS"
  type        = string
}