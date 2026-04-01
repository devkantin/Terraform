# AWS KMS Module

Manages KMS keys with encryption, rotation, and multi-region support.

## Usage

```hcl
module "kms_key" {
  source = "./modules/aws-kms"

  key_name                   = "my-key"
  description                = "Key for data encryption"
  enable_key_rotation        = true
  deletion_window_in_days    = 10

  replica_regions = ["us-west-2", "eu-west-1"]

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `key_name` - Key name (required)
- `description` - Key description
- `deletion_window_in_days` - Deletion window (default: 10)
- `enable_key_rotation` - Auto key rotation (default: true)
- `multi_region` - Multi-region key (default: false)
- `replica_regions` - Regions for replicas

## Outputs

- `key_id` - The key ID
- `key_arn` - The key ARN
- `alias_arn` - The alias ARN
- `alias_name` - The alias name
- `replica_key_ids` - Map of region replica IDs
