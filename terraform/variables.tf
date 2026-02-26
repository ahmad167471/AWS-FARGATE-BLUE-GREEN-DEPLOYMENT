variable "project_name" {
  description = "The name of the project, used for naming resources"
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

variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}