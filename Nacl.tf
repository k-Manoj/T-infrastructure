resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.default.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    from_port  = 443
    to_port    = 443
    cidr_block = var.vpc_cidr
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    from_port  = 80
    to_port    = 80
    cidr_block = var.vpc_cidr
  }
}
