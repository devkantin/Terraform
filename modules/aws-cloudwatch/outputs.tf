output "log_group_name" {
  description = "The name of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.log_group.name
}

output "log_group_arn" {
  description = "The ARN of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.log_group.arn
}

output "alarm_names" {
  description = "Map of alarm keys to alarm names"
  value       = { for k, alarm in aws_cloudwatch_metric_alarm.alarms : k => alarm.alarm_name }
}

output "alarm_arns" {
  description = "Map of alarm keys to alarm ARNs"
  value       = { for k, alarm in aws_cloudwatch_metric_alarm.alarms : k => alarm.arn }
}

output "dashboard_name" {
  description = "The name of the dashboard"
  value       = try(aws_cloudwatch_dashboard.dashboard[0].dashboard_name, null)
}
