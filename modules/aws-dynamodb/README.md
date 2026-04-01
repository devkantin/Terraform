# AWS DynamoDB Module

Creates DynamoDB tables with streams, encryption, and scaling options.

## Usage

```hcl
module "dynamodb_table" {
  source = "./modules/aws-dynamodb"

  table_name   = "my-table"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"

  attributes = [
    { name = "id", type = "S" },
    { name = "timestamp", type = "N" }
  ]

  stream_enabled = true
  encryption_enabled = true

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `table_name` - Table name (required)
- `hash_key` - Hash key attribute (required)
- `range_key` - Range key attribute
- `billing_mode` - PAY_PER_REQUEST or PROVISIONED (default: PAY_PER_REQUEST)
- `attributes` - Table attributes
- `stream_enabled` - Enable streams (default: true)
- `encryption_enabled` - Enable encryption (default: true)
- `point_in_time_recovery_enabled` - Enable PITR (default: true)

## Outputs

- `table_id` - The table ID
- `table_arn` - The table ARN
- `table_name` - The table name
- `stream_arn` - The stream ARN
