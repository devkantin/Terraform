# AWS Application Load Balancer (ALB) Module

This module provides a reusable way to create and configure an Application Load Balancer with target groups and listeners.

## Usage

```hcl
module "alb" {
  source = "./modules/aws-alb"

  alb_name            = "my-alb"
  security_groups     = [aws_security_group.alb.id]
  subnets             = module.vpc.public_subnet_ids
  vpc_id              = module.vpc.vpc_id

  target_groups = {
    web = {
      name     = "web-tg"
      port     = 80
      protocol = "HTTP"
      health_check = {
        path    = "/"
        matcher = "200"
      }
    }
  }

  listeners = {
    http = {
      port             = 80
      protocol         = "HTTP"
      target_group_key = "web"
    }
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `alb_name` - The name of the load balancer (required)
- `security_groups` - List of security group IDs (required)
- `subnets` - List of subnet IDs (required)
- `vpc_id` - The VPC ID for target groups (required)
- `internal` - Internal load balancer (default: false)
- `enable_deletion_protection` - Enable deletion protection (default: false)
- `enable_http2` - Enable HTTP/2 (default: true)
- `enable_cross_zone_load_balancing` - Enable cross-zone LB (default: true)
- `target_groups` - Map of target group configurations
- `listeners` - Map of listener configurations
- `target_attachments` - List of target attachments

## Outputs

- `alb_id` - The load balancer ID
- `alb_arn` - The load balancer ARN
- `alb_dns_name` - The DNS name
- `alb_zone_id` - The zone ID
- `target_group_ids` - Map of target group keys to IDs
- `target_group_arns` - Map of target group keys to ARNs
- `listener_ids` - Map of listener keys to IDs
