# Transit Gateway

resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "Demo TGW"
  amazon_side_asn                 = 64512
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = {
    Name = "demo-tgw"
  }
}

# TGW Route Table
resource "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  tags = {
    Name = "tgw-demo-rt"
  }
}

# Attach VPC A (TGW subnet) to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "attach_a" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_a.id
  subnet_ids         = [aws_subnet.subnet_a_tgw.id]

  tags = {
    Name = "tgw-attach-a"
  }
}

# Attach VPC B (TGW subnet) to TGW
resource "aws_ec2_transit_gateway_vpc_attachment" "attach_b" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_b.id
  subnet_ids         = [aws_subnet.subnet_b_tgw.id]

  tags = {
    Name = "tgw-attach-b"
  }
}

# Associate attachments with TGW route table
resource "aws_ec2_transit_gateway_route_table_association" "assoc_a" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_a.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "assoc_b" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_b.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
}

# Routes inside TGW RT: send 10.0.2.0/24 to A, 10.1.2.0/24 to B
resource "aws_ec2_transit_gateway_route" "tgw_to_vpc_a" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
  destination_cidr_block         = "10.0.2.0/24"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_a.id
}

resource "aws_ec2_transit_gateway_route" "tgw_to_vpc_b" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt.id
  destination_cidr_block         = "10.1.2.0/24"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_b.id
}

# VPC route tables (TGW subnets) to send traffic to TGW
resource "aws_route" "rt_a_tgw_to_b_tgw" {
  route_table_id         = aws_route_table.rt_a_tgw.id
  destination_cidr_block = "10.1.2.0/24"
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
}

resource "aws_route" "rt_b_tgw_to_a_tgw" {
  route_table_id         = aws_route_table.rt_b_tgw.id
  destination_cidr_block = "10.0.2.0/24"
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
}

