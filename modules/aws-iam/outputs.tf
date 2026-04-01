output "role_id" {
  description = "The ID of the IAM role"
  value       = aws_iam_role.role.id
}

output "role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.role.arn
}

output "role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.role.name
}

output "instance_profile_id" {
  description = "The ID of the instance profile"
  value       = try(aws_iam_instance_profile.profile[0].id, null)
}

output "instance_profile_arn" {
  description = "The ARN of the instance profile"
  value       = try(aws_iam_instance_profile.profile[0].arn, null)
}

output "user_ids" {
  description = "Map of user names to user IDs"
  value       = { for user_name, user in aws_iam_user.user : user_name => user.id }
}

output "user_arns" {
  description = "Map of user names to user ARNs"
  value       = { for user_name, user in aws_iam_user.user : user_name => user.arn }
}
