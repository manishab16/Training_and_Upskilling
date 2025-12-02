output "ec2_a_peer_public_ip" {
  value = aws_instance.ec2_a_peer.public_ip
}

output "ec2_b_peer_private_ip" {
  value = aws_instance.ec2_b_peer.private_ip
}

output "ec2_a_tgw_public_ip" {
  value = aws_instance.ec2_a_tgw.public_ip
}

output "ec2_b_tgw_private_ip" {
  value = aws_instance.ec2_b_tgw.private_ip
}

