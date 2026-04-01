# AWS RDS Module

This module provides a reusable way to create and configure an RDS database instance on AWS.

## Usage

```hcl
module "rds_database" {
  source = "./modules/aws-rds"

  instance_identifier = "my-database"
  engine             = "postgresql"
  engine_version     = "14.7"
  instance_class     = "db.t3.micro"
  
  database_name     = "mydb"
  database_username = "admin"
  database_password = "SecurePassword123!"
  
  allocated_storage = 100
  multi_az         = true
  
  vpc_security_group_ids = [aws_security_group.rds.id]
  
  common_tags = {
    Environment = "production"
    Team        = "database"
  }
}
```

## Inputs

- `instance_identifier` - The name of the RDS instance (required)
- `engine` - Database engine: mysql, postgresql, mariadb, oracle-se2, sqlserver-ex (required)
- `engine_version` - Database engine version (required)
- `instance_class` - Instance type (default: db.t3.micro)
- `database_name` - Initial database name (default: mydb)
- `database_username` - Master username (required, sensitive)
- `database_password` - Master password (required, sensitive)
- `allocated_storage` - Storage in GB (default: 100)
- `storage_type` - Storage type: gp2, gp3, io1, io2 (default: gp3)
- `storage_encrypted` - Enable encryption (default: true)
- `multi_az` - Enable Multi-AZ (default: true)
- `backup_retention_period` - Backup retention days (default: 7)

## Outputs

- `instance_id` - The RDS instance ID
- `instance_endpoint` - The connection endpoint
- `instance_address` - The instance address
- `instance_port` - The database port
- `instance_arn` - The ARN of the instance
