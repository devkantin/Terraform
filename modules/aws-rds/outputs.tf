output "instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.database.id
}

output "instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.database.endpoint
}

output "instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.database.address
}

output "instance_port" {
  description = "The database port"
  value       = aws_db_instance.database.port
}

output "instance_resource_id" {
  description = "The RDS instance resource ID"
  value       = aws_db_instance.database.resource_id
}

output "instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.database.arn
}
