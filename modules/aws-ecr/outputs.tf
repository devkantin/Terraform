output "repository_url" {
  description = "The repository URL"
  value       = aws_ecr_repository.repository.repository_url
}

output "repository_arn" {
  description = "The repository ARN"
  value       = aws_ecr_repository.repository.arn
}

output "registry_id" {
  description = "The registry ID"
  value       = aws_ecr_repository.repository.registry_id
}
