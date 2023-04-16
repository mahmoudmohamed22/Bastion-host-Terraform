resource "aws_subnet" "public_sub1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.1.0/24"
  availability_zone ="us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subent-1"
  }
}

resource "aws_subnet" "public_sub2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.2.0/24"
  availability_zone ="us-east-1b"
  map_public_ip_on_launch = true
 
  tags = {
    Name = "pub-subent-2"
  }
}