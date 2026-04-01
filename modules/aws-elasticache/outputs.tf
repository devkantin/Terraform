output "cluster_id" {
  description = "The cluster ID"
  value       = aws_elasticache_cluster.cluster.id
}

output "cluster_address" {
  description = "The DNS name of the cluster"
  value       = aws_elasticache_cluster.cluster.cluster_addresses[0].address
}

output "port" {
  description = "The port of the cluster"
  value       = aws_elasticache_cluster.cluster.port
}

output "engine" {
  description = "The engine used"
  value       = aws_elasticache_cluster.cluster.engine
}

output "subnet_group_name" {
  description = "The subnet group name"
  value       = try(aws_elasticache_subnet_group.subnet_group[0].name, null)
}
