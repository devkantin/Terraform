# AWS CodeDeploy Module

Manages CodeDeploy applications and deployment groups for CI/CD.

## Usage

```hcl
module "codedeploy" {
  source = "./modules/aws-codedeploy"

  app_name              = "my-app"
  compute_platform      = "Server"
  deployment_group_name = "production"
  service_role_arn      = aws_iam_role.codedeploy.arn
  deployment_type       = "in-place"

  auto_rollback_enabled = true
  target_group_name     = aws_lb_target_group.app.name

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `app_name` - Application name (required)
- `compute_platform` - Server, Lambda, OnPremises (default: Server)
- `deployment_group_name` - Group name (required)
- `service_role_arn` - Service role ARN (required)
- `deployment_config_name` - Deployment config
- `auto_rollback_enabled` - Enable rollback (default: true)
- `target_group_name` - Target group for load balancer

## Outputs

- `app_id` - The application ID
- `app_arn` - The application ARN
- `deployment_group_id` - The deployment group ID
