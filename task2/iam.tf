resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_secrets_manager_profile"
  role = aws_iam_role.ec2_role.name
}

data "aws_iam_policy_document" "assume_ec2_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2_secrets_manager_role"
  assume_role_policy = data.aws_iam_policy_document.assume_ec2_role.json
}

resource "aws_iam_policy" "secrets_manager_policy" {
  name        = "secrets_manager_policy"
  description = "Allow EC2 to access Secrets Manager"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "secretsmanager:GetSecretValue"
        Resource = aws_secretsmanager_secret.github_access_token_secret.arn
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_secrets_manager_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}
