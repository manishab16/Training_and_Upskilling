output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.vertical_demo.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance being vertically scaled"
  value       = aws_instance.vertical_demo.id
}

output "current_instance_type" {
  description = "Current instance type (at last apply)"
  value       = aws_instance.vertical_demo.instance_type
}
