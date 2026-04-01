output "trail_id" {
  description = "The CloudTrail ID"
  value       = aws_cloudtrail.trail.id
}

output "trail_arn" {
  description = "The CloudTrail ARN"
  value       = aws_cloudtrail.trail.arn
}

output "trail_home_region" {
  description = "The home region of the trail"
  value       = aws_cloudtrail.trail.home_region
}
