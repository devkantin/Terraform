# AWS IAM Module

This module provides a reusable way to create and configure IAM roles, users, and policies on AWS.

## Usage

```hcl
module "iam_role" {
  source = "./modules/aws-iam"

  role_name = "ec2-app-role"
  assume_role_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  }

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  inline_policies = {
    s3_access = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "s3:*"
          Resource = "*"
        }
      ]
    }
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `role_name` - The name of the IAM role (required)
- `assume_role_policy` - The assume role policy document (required)
- `managed_policy_arns` - List of managed policy ARNs to attach
- `inline_policies` - Map of inline policy names to policy documents
- `create_instance_profile` - Create instance profile (default: true)
- `create_users` - Create IAM users (default: false)
- `user_names` - List of user names to create
- `user_managed_policy_arns` - Managed policies to attach to users

## Outputs

- `role_id` - The IAM role ID
- `role_arn` - The IAM role ARN
- `role_name` - The IAM role name
- `instance_profile_id` - The instance profile ID
- `instance_profile_arn` - The instance profile ARN
- `user_ids` - Map of user names to user IDs
- `user_arns` - Map of user names to user ARNs
