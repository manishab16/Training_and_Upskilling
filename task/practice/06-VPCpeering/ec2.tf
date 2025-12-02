resource "aws_instance" "ec2_a_peer" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet_a_peer.id
  vpc_security_group_ids = [aws_security_group.sg_a.id]
  key_name               = var.key_name 
  tags = {
    Name = "ec2-a-peer"
  }
}

resource "aws_instance" "ec2_b_peer" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet_b_peer.id
  vpc_security_group_ids = [aws_security_group.sg_b.id]
  key_name               = var.key_name

  tags = {
    Name = "ec2-b-peer"
  }
}

resource "aws_instance" "ec2_a_tgw" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet_a_tgw.id
  vpc_security_group_ids = [aws_security_group.sg_a.id]
  key_name               = var.key_name

  tags = {
    Name = "ec2-a-tgw"
  }
}

resource "aws_instance" "ec2_b_tgw" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet_b_tgw.id
  vpc_security_group_ids = [aws_security_group.sg_b.id]
  key_name               = var.key_name

  tags = {
    Name = "ec2-b-tgw"
  }
}

