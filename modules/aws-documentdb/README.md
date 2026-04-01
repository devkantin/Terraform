# AWS DocumentDB Module

Provisions MongoDB-compatible DocumentDB clusters with encryption and backups.

## Usage

```hcl
module "documentdb" {
  source = "./modules/aws-documentdb"

  cluster_identifier = "my-docdb"
  master_username    = "admin"
  master_password    = var.db_password
  num_instances      = 3
  instance_class     = "db.t3.small"

  storage_encrypted  = true
  vpc_security_group_ids = [aws_security_group.docdb.id]

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `cluster_identifier` - Cluster identifier (required)
- `master_username` - Master username (required, sensitive)
- `master_password` - Master password (required, sensitive)
- `num_instances` - Number of instances (default: 3)
- `instance_class` - Instance class (default: db.t3.small)
- `storage_encrypted` - Enable encryption (default: true)
- `backup_retention_period` - Retention days (default: 7)

## Outputs

- `cluster_id` - The cluster ID
- `cluster_arn` - The cluster ARN
- `cluster_endpoint` - The cluster endpoint
- `cluster_reader_endpoint` - The reader endpoint
- `instance_endpoints` - Map of instance endpoints
