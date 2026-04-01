output "table_id" {
  description = "The table ID"
  value       = aws_dynamodb_table.table.id
}

output "table_arn" {
  description = "The table ARN"
  value       = aws_dynamodb_table.table.arn
}

output "table_name" {
  description = "The table name"
  value       = aws_dynamodb_table.table.name
}

output "stream_arn" {
  description = "The stream ARN"
  value       = aws_dynamodb_table.table.stream_arn
}
