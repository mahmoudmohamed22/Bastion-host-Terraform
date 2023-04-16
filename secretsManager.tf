resource "aws_secretsmanager_secret" "secretsmanager" {
  name                    = "my-private-key"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "secretsmanager_v" {
  secret_id     = aws_secretsmanager_secret.secretsmanager.id
  secret_string = tls_private_key.creatorkey.private_key_pem
}
