# AWS S3 Module

This module provides a reusable way to create and configure an S3 bucket on AWS.

## Usage

```hcl
module "s3_bucket" {
  source = "./modules/aws-s3"

  bucket_name      = "my-data-bucket"
  enable_versioning = true
  enable_encryption = true
  enable_logging    = true
  logging_bucket    = aws_s3_bucket.logging.id

  common_tags = {
    Environment = "production"
    Team        = "data"
  }
}
```

## Inputs

- `bucket_name` - The name of the S3 bucket (required)
- `enable_versioning` - Enable versioning (default: true)
- `enable_encryption` - Enable server-side encryption (default: true)
- `encryption_algorithm` - Encryption algorithm to use: 'AES256' or 'aws:kms' (default: AES256)
- `block_public_acls` - Block public ACLs (default: true)
- `block_public_policy` - Block public bucket policy (default: true)
- `ignore_public_acls` - Ignore existing public ACLs (default: true)
- `restrict_public_buckets` - Restrict public bucket access (default: true)
- `enable_logging` - Enable S3 access logging (default: false)
- `logging_bucket` - Target bucket for logging
- `logging_prefix` - Prefix for logging objects (default: logs/)

## Outputs

- `bucket_id` - The S3 bucket name
- `bucket_arn` - The ARN of the bucket
- `bucket_region` - The AWS region of the bucket
