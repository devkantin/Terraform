# AWS Secrets Manager Module

Securely manages sensitive data like passwords and API keys.

## Usage

```hcl
module "secrets" {
  source = "./modules/aws-secrets-manager"

  name_prefix = "db-password"
  description = "RDS database password"
  kms_key_id  = aws_kms_key.secrets.id

  secret_value = var.db_password

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `name_prefix` - Secret name prefix (required)
- `description` - Secret description
- `kms_key_id` - Encryption key ID
- `recovery_window_in_days` - Recovery window (default: 7)
- `secret_value` - Secret value (sensitive)

## Outputs

- `secret_id` - The secret ID
- `secret_arn` - The secret ARN
- `secret_version_id` - The version ID
