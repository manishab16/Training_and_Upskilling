# Latest Amazon Linux 2 AMI
data "aws_ami" "al2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["137112412989"]  # Amazon
}

# User data (bash script) that installs Apache and shows app version
locals {
  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd
              echo "Hello from ${var.project_name} - version ${var.app_version}" > /var/www/html/index.html
              systemctl enable httpd
              systemctl start httpd
              EOF
}

resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = data.aws_ami.al2.id
  instance_type = "t3.micro"

  user_data = base64encode(local.user_data)

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name                      = "${var.project_name}-asg"
  max_size                  = 3
  min_size                  = 2
  desired_capacity          = 2
  health_check_type         = "ELB"
  health_check_grace_period = 60

  vpc_zone_identifier = data.aws_subnets.default.ids
  target_group_arns   = [aws_lb_target_group.app_tg.arn]

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  # This block configures rolling updates when launch_template changes
  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
      instance_warmup        = 60
    }

    triggers = ["launch_template"]
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-instance"
    propagate_at_launch = true
  }

  depends_on = [aws_lb_listener.http]

  lifecycle {
    create_before_destroy = true
  }
}
