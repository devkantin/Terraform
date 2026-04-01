# AWS SQS Module

Provisions SQS queues with optional FIFO, encryption, and dead-letter routing.

## Usage

```hcl
module "sqs_queue" {
  source = "./modules/aws-sqs"

  queue_name                = "my-queue"
  visibility_timeout_seconds = 60
  message_retention_seconds  = 86400
  fifo_queue                = false

  kms_master_key_id = aws_kms_key.sqs.id

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `queue_name` - Queue name (required)
- `visibility_timeout_seconds` - Visibility timeout (default: 30)
- `message_retention_seconds` - Retention time (default: 345600)
- `delay_seconds` - Delivery delay (default: 0)
- `max_message_size` - Max size in bytes (default: 262144)
- `fifo_queue` - Create FIFO queue (default: false)
- `kms_master_key_id` - Encryption key ID

## Outputs

- `queue_id` - The queue URL
- `queue_arn` - The queue ARN
- `queue_url` - The queue URL
