resource "aws_instance" "task_2_instance" {
  ami                    = data.aws_ami.amzn-linux-2023-ami.id
  instance_type          = "t2.micro"
  key_name               = "TerraformTasks"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  
  user_data = file("script.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "Task2Instance"
  }
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

  tags = {
    Name = "allow_ssh_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "incoming_ssh" {
  security_group_id = aws_security_group.allow_ssh_http.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "incoming_http" {
  security_group_id = aws_security_group.allow_ssh_http.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "outgoing_http" {
  security_group_id = aws_security_group.allow_ssh_http.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}