resource "aws_security_group" "public_SG" {
  name        = "public_SG"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpc_main.id

  ingress {
    description      = "allow ssh from 0.0.0.0/0"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public_SG"
  }
}
resource "aws_security_group" "private_SG" {
  name        = "private_SG"
  description = "Allow ssh and port 3000"
  vpc_id      = aws_vpc.vpc_main.id

   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_main.cidr_block]
  }
  
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_main.cidr_block]
  }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "private_SG"
  }
}