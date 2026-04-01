resource "aws_elasticache_cluster" "cluster" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port

  security_group_ids = var.security_group_ids
  subnet_group_name  = var.subnet_group_name

  automatic_failover_enabled = var.automatic_failover_enabled
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  maintenance_window         = var.maintenance_window

  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window          = var.snapshot_window

  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled

  notification_topic_arn = var.notification_topic_arn

  tags = merge(
    var.common_tags,
    {
      Name = var.cluster_id
    }
  )
}

resource "aws_elasticache_subnet_group" "subnet_group" {
  count           = var.create_subnet_group ? 1 : 0
  name            = var.subnet_group_name
  subnet_ids      = var.subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = var.subnet_group_name
    }
  )
}
