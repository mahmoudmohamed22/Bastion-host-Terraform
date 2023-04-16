resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc_main.id

  route {
    cidr_block = "0.0.0.0/0" #Destination
    gateway_id = aws_internet_gateway.igw.id # target
  }

  route {
    ipv6_cidr_block        = "::/0" #Destination
    gateway_id = aws_internet_gateway.igw.id # target
  }

  tags = {
    Name = "pub-rtb"
  }
}