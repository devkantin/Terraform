output "secret_id" {
  description = "The secret ID"
  value       = aws_secretsmanager_secret.secret.id
}

output "secret_arn" {
  description = "The secret ARN"
  value       = aws_secretsmanager_secret.secret.arn
}

output "secret_version_id" {
  description = "The secret version ID"
  value       = try(aws_secretsmanager_secret_version.secret_version[0].version_id, null)
}
