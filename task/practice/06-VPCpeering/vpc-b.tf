
resource "aws_vpc" "vpc_b" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC-B"
  }
}

# Subnet for VPC peering tests
resource "aws_subnet" "subnet_b_peer" {
  vpc_id                  = aws_vpc.vpc_b.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-b-peer"
  }
}

# Subnet for Transit Gateway tests
resource "aws_subnet" "subnet_b_tgw" {
  vpc_id                  = aws_vpc.vpc_b.id
  cidr_block              = "10.1.2.0/24"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-b-tgw"
  }
}

# Internet Gateway for VPC B
resource "aws_internet_gateway" "igw_b" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name = "igw-b"
  }
}

# Route table for Peering subnet
resource "aws_route_table" "rt_b_peer" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name = "rt-b-peer"
  }
}

resource "aws_route_table_association" "rt_assoc_b_peer" {
  subnet_id      = aws_subnet.subnet_b_peer.id
  route_table_id = aws_route_table.rt_b_peer.id
}

# Route table for TGW subnet
resource "aws_route_table" "rt_b_tgw" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name = "rt-b-tgw"
  }
}

resource "aws_route_table_association" "rt_assoc_b_tgw" {
  subnet_id      = aws_subnet.subnet_b_tgw.id
  route_table_id = aws_route_table.rt_b_tgw.id
}

# Internet routes
resource "aws_route" "rt_b_peer_inet" {
  route_table_id         = aws_route_table.rt_b_peer.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_b.id
}

resource "aws_route" "rt_b_tgw_inet" {
  route_table_id         = aws_route_table.rt_b_tgw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_b.id
}

# Security group for instances in VPC B
resource "aws_security_group" "sg_b" {
  name        = "vpc-b-sg"
  description = "Allow SSH and ICMP from private ranges"
  vpc_id      = aws_vpc.vpc_b.id

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
    Name = "sg-b"
  }
}

