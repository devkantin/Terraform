output "volume_id" {
  description = "The volume ID"
  value       = aws_ebs_volume.volume.id
}

output "volume_arn" {
  description = "The volume ARN"
  value       = aws_ebs_volume.volume.arn
}

output "attachment_id" {
  description = "The attachment ID"
  value       = try(aws_volume_attachment.attachment[0].id, null)
}

output "snapshot_id" {
  description = "The snapshot ID"
  value       = try(aws_ebs_snapshot.snapshot[0].id, null)
}
