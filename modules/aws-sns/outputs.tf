output "topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.topic.arn
}

output "topic_name" {
  description = "The name of the SNS topic"
  value       = aws_sns_topic.topic.name
}

output "subscription_arns" {
  description = "Map of subscription names to ARNs"
  value       = { for k, sub in aws_sns_topic_subscription.subscriptions : k => sub.arn }
}
