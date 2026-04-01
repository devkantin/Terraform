output "key_id" {
  description = "The KMS key ID"
  value       = aws_kms_key.key.id
}

output "key_arn" {
  description = "The KMS key ARN"
  value       = aws_kms_key.key.arn
}

output "alias_arn" {
  description = "The KMS alias ARN"
  value       = aws_kms_alias.alias.arn
}

output "alias_name" {
  description = "The KMS alias name"
  value       = aws_kms_alias.alias.name
}

output "replica_key_ids" {
  description = "Map of regions to replica key IDs"
  value       = { for region, key in aws_kms_replica_key.replica : region => key.id }
}
