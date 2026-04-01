output "asg_id" {
  description = "The Auto Scaling Group ID"
  value       = aws_autoscaling_group.asg.id
}

output "asg_name" {
  description = "The Auto Scaling Group name"
  value       = aws_autoscaling_group.asg.name
}

output "asg_arn" {
  description = "The Auto Scaling Group ARN"
  value       = aws_autoscaling_group.asg.arn
}

output "policy_arns" {
  description = "Map of policy names to ARNs"
  value       = { for k, policy in aws_autoscaling_policy.policies : k => policy.arn }
}
