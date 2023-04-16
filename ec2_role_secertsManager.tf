resource "aws_iam_role" "ec2_secretmanager_role" {
  name = "ec2_secretmanager_role"
  
   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "test"
  }
}
resource "aws_iam_role_policy" "test_secretmanager_policy" {
  name = "test_secretmanager_policy"
  role = "${aws_iam_role.ec2_secretmanager_role.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Action": "secretsmanager:GetSecretValue",
        "Resource": "${aws_secretsmanager_secret.secretsmanager.arn}"
    }]
}
EOF

}



resource "aws_iam_instance_profile" "test_instance_profile" {
  name = "test_instance_profile"
  role = "${aws_iam_role.ec2_secretmanager_role.name}"
}
