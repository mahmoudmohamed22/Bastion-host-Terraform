resource "aws_instance" "bastionhost1" {
  ami                     = "ami-06e46074ae430fba6"
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.public_sub1.id
  vpc_security_group_ids  = [aws_security_group.public_SG.id]
  iam_instance_profile    = aws_iam_instance_profile.test_instance_profile.name
  key_name                = "tf-key-pair"
  user_data = <<-EOF
              #!/bin/bash
              echo $(aws secretsmanager get-secret-value --secret-id my-private-key --query SecretString --output text) > /home/ec2-user/tf-key-pair.pem 
              chown ec2-user:ec2-user tf-key-pair.pem
              chmod 400 /home/ec2-user/tf-key-pair.pem
              EOF
  tags = {
    Name = "public-ec2-1"
  }
  
}

resource "aws_instance" "bastionhost2" {
 ami                     = "ami-06e46074ae430fba6"
 instance_type           = "t2.micro"
 subnet_id               =  aws_subnet.public_sub2.id
 vpc_security_group_ids  = [aws_security_group.public_SG.id]
 iam_instance_profile    = aws_iam_instance_profile.test_instance_profile.name
 key_name                = "tf-key-pair"
  user_data = <<-EOF
              #!/bin/bash
              echo $(aws secretsmanager get-secret-value --secret-id my-private-key --query SecretString --output text) > /home/ec2-user/tf-key-pair.pem 
              chown ec2-user:ec2-user tf-key-pair.pem
              chmod 400 /home/ec2-user/tf-key-pair.pem
              EOF
  tags = {
    Name = "public-ec2-2"
  }
}
