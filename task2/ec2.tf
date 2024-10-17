resource "aws_instance" "task_2_instance" {
  ami                    = "ami-0acc77abdfc7ed5a6"
  instance_type          = "t2.micro"
  key_name               = "TerraformTasks"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Task2Instance"
  }
}

data "aws_vpc" "default" {
    default = true
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "incoming_ssh" {
  security_group_id = aws_security_group.allow_ssh.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}