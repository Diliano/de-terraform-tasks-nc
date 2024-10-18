resource "aws_secretsmanager_secret" "github_access_token_secret" {
  name        = "github_access_token"
  description = "Github access token for EC2"
}

resource "aws_secretsmanager_secret_version" "github_access_token_version" {
  secret_id     = aws_secretsmanager_secret.github_access_token_secret.id
  secret_string = var.github_access_token
}