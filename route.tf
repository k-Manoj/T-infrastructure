resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table" "terraform-private-1" {
  vpc_id = aws_vpc.default.id
}
resource "aws_route_table_association" "terraform-private-1" {
  subnet_id      = aws_subnet.subnet1-private.id
  route_table_id = aws_route_table.terraform-private-1.id
}
