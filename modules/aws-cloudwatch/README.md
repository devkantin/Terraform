# AWS CloudWatch Module

This module creates CloudWatch log groups, metric alarms, and dashboards.

## Usage

```hcl
module "cloudwatch" {
  source = "./modules/aws-cloudwatch"

  log_group_name   = "/aws/lambda/my-function"
  retention_in_days = 30

  metric_alarms = {
    high_cpu = {
      alarm_name          = "ec2-high-cpu"
      comparison_operator = "GreaterThanThreshold"
      evaluation_periods  = 2
      metric_name         = "CPUUtilization"
      namespace           = "AWS/EC2"
      period              = 300
      statistic           = "Average"
      threshold           = 80
      alarm_description   = "Alert when EC2 CPU exceeds 80%"
      dimensions = {
        InstanceId = "i-1234567890abcdef0"
      }
    }
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `log_group_name` - Name of the log group (required)
- `retention_in_days` - Log retention in days (default: 7)
- `kms_key_id` - KMS key for encryption
- `metric_alarms` - Map of metric alarms
- `create_dashboard` - Create CloudWatch dashboard (default: false)

## Outputs

- `log_group_name` - The log group name
- `log_group_arn` - The log group ARN
- `alarm_names` - Map of alarm names
- `alarm_arns` - Map of alarm ARNs
