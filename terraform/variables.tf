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