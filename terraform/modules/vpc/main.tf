# Get Default VPC
data "aws_vpc" "this" {
  default = true
}

# Get only ONE subnet per AZ (fixes ALB issue)
data "aws_subnets" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}