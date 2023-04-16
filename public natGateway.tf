# create elastic ip first then attach nat 
resource "aws_eip" "lb" {
  vpc      = true
}


resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_sub1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
