data "aws_subnet_ids" "private" {
  vpc_id = aws_vpc.demo.id
  tags = {
      Name = "*private*"
  }
}

resource "aws_network_acl" "demo" {
  vpc_id = aws_vpc.demo.id

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.demo.cidr_block
    from_port  = 0
    to_port    = 0
  }

 ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1025
    to_port    = 65535
  }

 subnet_ids = data.aws_subnet_ids.private.ids

  tags = {
    Name = "demo"
  }
  
}
