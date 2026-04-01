resource "aws_cloudtrail" "trail" {
  name           = var.trail_name
  s3_bucket_name = var.s3_bucket_name
  depends_on     = [aws_s3_bucket_policy.cloudtrail_policy]

  is_multi_region_trail = var.is_multi_region_trail
  enable_log_file_validation = var.enable_log_file_validation
  include_global_service_events = var.include_global_service_events

  is_organization_trail = var.is_organization_trail

  kms_key_id = var.kms_key_id

  event_selector {
    read_write_type           = var.event_selector_read_write_type
    include_management_events = var.include_management_events

    dynamic "data_resource" {
      for_each = var.data_resources
      content {
        type   = data_resource.value.type
        values = data_resource.value.values
      }
    }
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.trail_name
    }
  )
}

resource "aws_s3_bucket_policy" "cloudtrail_policy" {
  bucket = var.s3_bucket_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:GetBucketAcl"
        Resource = "arn:aws:s3:::${var.s3_bucket_name}"
      },
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}
