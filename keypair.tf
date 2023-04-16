resource "tls_private_key" "creatorkey" {
algorithm = "RSA"
rsa_bits  = 4096
}

resource "aws_key_pair" "tf-key-pair" {
key_name = "tf-key-pair"
public_key = tls_private_key.creatorkey.public_key_openssh
}

resource "local_file" "tf-key" {
content  = tls_private_key.creatorkey.private_key_pem
filename = "tf-key-pair.pem"
}