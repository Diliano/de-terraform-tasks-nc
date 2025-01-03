resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

  tags = {
    Name = "Allow inbound SSH and HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "incoming_ssh" {
  security_group_id = aws_security_group.allow_ssh_http.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22

  tags = {
    Name = "Allow incoming SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "incoming_http" {
  security_group_id = aws_security_group.allow_ssh_http.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

  tags = {
    Name = "Allow incoming HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "outgoing_http" {
  security_group_id = aws_security_group.allow_ssh_http.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "Allow outgoing HTTP"
  }
}