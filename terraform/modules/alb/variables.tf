variable "vpc_id" {
  type    = string
  default = "vpc-0b34d31a7ceaa6a50"  # Replace with your VPC ID
}

variable "public_subnets" {
  type = list(string)
  default = [
    "subnet-070066fbc185a64a5", # Public 1 (use1-az5)
    "subnet-0c197b98b3a143ce8"  # Public 2 (use1-az4)
  ]
}

variable "alb_sg_id" {
  type    = string
  default = "sg-0a1b2c3d4e5f6g7h"  # Replace with your ALB SG
}

variable "project_name" {
  type    = string
  default = "ahmad-bluegreen"
}