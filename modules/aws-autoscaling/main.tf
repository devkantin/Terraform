resource "aws_autoscaling_group" "asg" {
  name                = var.name
  vpc_zone_identifier = var.vpc_zone_identifier
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  health_check_type   = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  default_cooldown    = var.default_cooldown

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  target_group_arns = var.target_group_arns

  termination_policies = var.termination_policies

  tag {
    key                 = "Name"
    value               = var.name
    propagate_launch_template = true
  }

  dynamic "tag" {
    for_each = var.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_launch_template = true
    }
  }
}

resource "aws_autoscaling_policy" "policies" {
  for_each = var.scaling_policies

  name                   = each.key
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = each.value.adjustment_type
  scaling_adjustment     = each.value.scaling_adjustment
  cooldown               = each.value.cooldown
}
