output "app_id" {
  description = "The CodeDeploy app ID"
  value       = aws_codedeploy_app.app.id
}

output "app_arn" {
  description = "The CodeDeploy app ARN"
  value       = aws_codedeploy_app.app.arn
}

output "deployment_group_id" {
  description = "The deployment group ID"
  value       = aws_codedeploy_deployment_group.deployment_group.id
}
