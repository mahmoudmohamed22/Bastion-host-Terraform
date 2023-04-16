## attached public route table with public subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_sub1.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_sub2.id
  route_table_id = aws_route_table.public_route.id
}

# attached private table with private subent

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private_sub1.id
  route_table_id = aws_route_table.private_route.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private_sub2.id
  route_table_id = aws_route_table.private_route.id
}
