# AWS ElastiCache Module

Provisions Redis and Memcached clusters for caching and data storage.

## Usage

```hcl
module "elasticache" {
  source = "./modules/aws-elasticache"

  cluster_id       = "my-cache"
  engine           = "redis"
  node_type        = "cache.t3.micro"
  num_cache_nodes  = 2
  engine_version   = "7.0"

  security_group_ids = [aws_security_group.cache.id]
  subnet_group_name  = aws_elasticache_subnet_group.main.name

  at_rest_encryption_enabled = true

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `cluster_id` - Cluster identifier (required)
- `engine` - Engine type: redis, memcached (default: redis)
- `node_type` - Node type (required)
- `num_cache_nodes` - Number of nodes (default: 1)
- `security_group_ids` - Security group IDs
- `at_rest_encryption_enabled` - Enable encryption (default: true)
- `transit_encryption_enabled` - Enable transit encryption (default: true)

## Outputs

- `cluster_id` - The cluster ID
- `cluster_address` - The DNS name
- `port` - The port
- `engine` - The engine type
