output "cluster_id" {
  description = "The cluster ID"
  value       = aws_docdb_cluster.cluster.id
}

output "cluster_arn" {
  description = "The cluster ARN"
  value       = aws_docdb_cluster.cluster.arn
}

output "cluster_endpoint" {
  description = "The cluster endpoint"
  value       = aws_docdb_cluster.cluster.endpoint
}

output "cluster_reader_endpoint" {
  description = "The reader endpoint"
  value       = aws_docdb_cluster.cluster.reader_endpoint
}

output "instance_endpoints" {
  description = "Map of instance identifiers to endpoints"
  value       = { for inst in aws_docdb_cluster_instance.instances : inst.identifier => inst.endpoint }
}
