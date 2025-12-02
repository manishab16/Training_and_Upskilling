# VPC Peering 

resource "aws_vpc_peering_connection" "peer_ab" {
  vpc_id      = aws_vpc.vpc_a.id
  peer_vpc_id = aws_vpc.vpc_b.id
  auto_accept = true

  tags = {
    Name = "peer-a-b"
  }
}

resource "aws_route" "rt_a_peer_to_b_peer" {
  route_table_id            = aws_route_table.rt_a_peer.id
  destination_cidr_block    = "10.1.1.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_ab.id
}

resource "aws_route" "rt_b_peer_to_a_peer" {
  route_table_id            = aws_route_table.rt_b_peer.id
  destination_cidr_block    = "10.0.1.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_ab.id
}

