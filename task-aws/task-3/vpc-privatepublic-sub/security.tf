resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "private_ec2" {
  ami           = "ami-0a5c3558529277641"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_1.id
  key_name      = "my-key"

  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = { Name = "private-instance" }
}
