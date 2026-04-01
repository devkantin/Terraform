output "parameter_names" {
  description = "Map of parameter keys to names"
  value       = { for k, param in aws_ssm_parameter.parameter : k => param.name }
}

output "parameter_arns" {
  description = "Map of parameter keys to ARNs"
  value       = { for k, param in aws_ssm_parameter.parameter : k => param.arn }
}

output "parameter_values" {
  description = "Map of parameter keys to values"
  value       = { for k, param in aws_ssm_parameter.parameter : k => param.value }
  sensitive   = true
}
