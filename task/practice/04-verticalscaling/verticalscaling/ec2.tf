# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get all subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Pick the first subnet
locals {
  default_subnet_id = data.aws_subnets.default.ids[0]
}

# EC2 instance
resource "aws_instance" "vertical_demo" {
  ami                         = data.aws_ami.al2.id
  instance_type               = var.small_instance_type
  subnet_id                   = local.default_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "vertical-scaling-demo"
  }
}

# Latest Amazon Linux 2 AMI
data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["137112412989"]
}
