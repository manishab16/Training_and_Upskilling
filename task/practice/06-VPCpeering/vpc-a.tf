
resource "aws_vpc" "vpc_a" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC-A"
  }
}

# Subnet for VPC peering tests
resource "aws_subnet" "subnet_a_peer" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-peer"
  }
}

# Subnet for Transit Gateway tests
resource "aws_subnet" "subnet_a_tgw" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-a-tgw"
  }
}

# Internet Gateway for VPC A
resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "igw-a"
  }
}

# Route table for Peering subnet
resource "aws_route_table" "rt_a_peer" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "rt-a-peer"
  }
}

resource "aws_route_table_association" "rt_assoc_a_peer" {
  subnet_id      = aws_subnet.subnet_a_peer.id
  route_table_id = aws_route_table.rt_a_peer.id
}

# Route table for TGW subnet
resource "aws_route_table" "rt_a_tgw" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "rt-a-tgw"
  }
}

resource "aws_route_table_association" "rt_assoc_a_tgw" {
  subnet_id      = aws_subnet.subnet_a_tgw.id
  route_table_id = aws_route_table.rt_a_tgw.id
}

# Default Internet routes for both route tables
resource "aws_route" "rt_a_peer_inet" {
  route_table_id         = aws_route_table.rt_a_peer.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_a.id
}

resource "aws_route" "rt_a_tgw_inet" {
  route_table_id         = aws_route_table.rt_a_tgw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_a.id
}

# Security group for instances in VPC A
resource "aws_security_group" "sg_a" {
  name        = "vpc-a-sg"
  description = "Allow SSH and ICMP from private ranges"
  vpc_id      = aws_vpc.vpc_a.id

  ingress {
    description = "ICMP from 10.0.0.0/8"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    description = "SSH from anywhere (lab only)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-a"
  }
}

