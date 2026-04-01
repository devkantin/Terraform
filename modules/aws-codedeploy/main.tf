resource "aws_codedeploy_app" "app" {
  name             = var.app_name
  compute_platform = var.compute_platform

  tags = merge(
    var.common_tags,
    {
      Name = var.app_name
    }
  )
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name               = aws_codedeploy_app.app.name
  deployment_group_name  = var.deployment_group_name
  service_role_arn       = var.service_role_arn
  deployment_config_name = var.deployment_config_name
  deployment_type        = var.deployment_type

  auto_rollback_configuration {
    enabled = var.auto_rollback_enabled
    events  = var.auto_rollback_events
  }

  load_balancer_info {
    target_group_info {
      name = var.target_group_name
    }
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.deployment_group_name
    }
  )
}
