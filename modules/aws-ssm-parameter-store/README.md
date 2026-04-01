# AWS SSM Parameter Store Module

Manages application configuration and secrets in Parameter Store.

## Usage

```hcl
module "ssm_parameters" {
  source = "./modules/aws-ssm-parameter-store"

  parameters = {
    db_host = {
      name        = "/app/database/host"
      type        = "String"
      value       = "db.example.com"
      description = "Database hostname"
    }
    db_password = {
      name        = "/app/database/password"
      type        = "SecureString"
      value       = var.db_password
      tier        = "Standard"
      key_id      = aws_kms_key.app.id
    }
    api_key = {
      name  = "/app/api/key"
      type  = "SecureString"
      value = var.api_key
    }
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `parameters` - Map of parameters (required)

## Parameter Options

- `name` - Parameter name (required)
- `type` - String, StringList, SecureString (required)
- `value` - Parameter value (required)
- `description` - Parameter description
- `tier` - Standard or Advanced (default: Standard)
- `key_id` - KMS key for SecureString

## Outputs

- `parameter_names` - Map of parameter names
- `parameter_arns` - Map of parameter ARNs
- `parameter_values` - Map of parameter values (sensitive)
