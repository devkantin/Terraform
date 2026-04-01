output "cluster_id" {
  description = "The cluster ID"
  value       = aws_ecs_cluster.cluster.id
}

output "cluster_arn" {
  description = "The cluster ARN"
  value       = aws_ecs_cluster.cluster.arn
}

output "task_definition_arn" {
  description = "The task definition ARN"
  value       = aws_ecs_task_definition.task_definition.arn
}

output "task_definition_revision" {
  description = "The task definition revision"
  value       = aws_ecs_task_definition.task_definition.revision
}

output "service_id" {
  description = "The service ID"
  value       = try(aws_ecs_service.service[0].id, null)
}

output "service_arn" {
  description = "The service ARN"
  value       = try(aws_ecs_service.service[0].arn, null)
}
