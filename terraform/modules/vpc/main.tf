# Public subnets
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1f"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-2"
  }
}

# Private subnets
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1f"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-private-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-private-2"
  }
}
