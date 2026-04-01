resource "aws_secretsmanager_secret" "secret" {
  name_prefix             = var.name_prefix
  description             = var.description
  kms_key_id              = var.kms_key_id
  recovery_window_in_days = var.recovery_window_in_days

  tags = merge(
    var.common_tags,
    {
      Name = var.name_prefix
    }
  )
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  count          = var.secret_value != null ? 1 : 0
  secret_id      = aws_secretsmanager_secret.secret.id
  secret_string  = var.secret_value
}

resource "aws_secretsmanager_secret_policy" "policy" {
  count      = var.secret_policy != null ? 1 : 0
  secret_id  = aws_secretsmanager_secret.secret.id
  policy     = jsonencode(var.secret_policy)
}
