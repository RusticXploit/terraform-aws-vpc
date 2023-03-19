resource "aws_security_group" "public_web" {
  name        = "Public Web"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "Public Web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "public_web_http" {
  security_group_id = aws_security_group.public_web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  tags = {
    Name = "http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "public_web_https" {
  security_group_id = aws_security_group.public_web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  tags = {
    Name = "https"
  }

}

resource "aws_vpc_security_group_ingress_rule" "public_web_ssh" {
  security_group_id = aws_security_group.public_web.id

  cidr_ipv4   = var.offices_subnet_cidr.california
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  tags = {
    Name = "SSH"
  }
}

resource "aws_security_group" "private" {
  name        = "Private"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "Private"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private_mysql" {
  security_group_id = aws_security_group.private.id

  cidr_ipv4   = var.vpc_subnet_cidr.public
  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"

  tags = {
    Name = "Private MYSQL"
  }
}

