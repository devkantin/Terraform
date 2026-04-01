# AWS CloudTrail Module

Enables audit logging for AWS API calls and management events.

## Usage

```hcl
module "cloudtrail" {
  source = "./modules/aws-cloudtrail"

  trail_name         = "organization-trail"
  s3_bucket_name     = aws_s3_bucket.cloudtrail_logs.id
  is_multi_region_trail = true
  enable_log_file_validation = true

  kms_key_id = aws_kms_key.cloudtrail.id

  include_global_service_events = true

  data_resources = [
    {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::my-bucket/*"]
    }
  ]

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `trail_name` - Trail name (required)
- `s3_bucket_name` - S3 bucket for logs (required)
- `is_multi_region_trail` - Multi-region trail (default: true)
- `enable_log_file_validation` - Enable validation (default: true)
- `include_global_service_events` - Include CloudFront/IAM (default: true)
- `kms_key_id` - KMS key for encryption
- `data_resources` - Data resources to log

## Outputs

- `trail_id` - The trail ID
- `trail_arn` - The trail ARN
- `trail_home_region` - The home region
