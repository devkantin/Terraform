# AWS SNS Module

Provisions SNS topics with subscriptions and optional encryption.

## Usage

```hcl
module "sns_topic" {
  source = "./modules/aws-sns"

  topic_name   = "my-topic"
  display_name = "My Topic"
  fifo_topic   = false

  subscriptions = {
    email = {
      protocol = "email"
      endpoint = "admin@example.com"
    }
    lambda = {
      protocol = "lambda"
      endpoint = aws_lambda_function.processor.arn
    }
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `topic_name` - Topic name (required)
- `display_name` - Display name
- `kms_master_key_id` - Encryption key ID
- `fifo_topic` - Create FIFO topic (default: false)
- `subscriptions` - Map of subscriptions

## Outputs

- `topic_arn` - The topic ARN
- `topic_name` - The topic name
- `subscription_arns` - Map of subscription ARNs
