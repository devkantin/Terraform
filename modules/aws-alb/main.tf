resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection
  enable_http2              = var.enable_http2
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing

  tags = merge(
    var.common_tags,
    {
      Name = var.alb_name
    }
  )
}

resource "aws_lb_target_group" "target_groups" {
  for_each = var.target_groups

  name        = each.value.name
  port        = each.value.port
  protocol    = each.value.protocol
  vpc_id      = var.vpc_id
  target_type = each.value.target_type

  health_check {
    healthy_threshold   = each.value.health_check.healthy_threshold
    unhealthy_threshold = each.value.health_check.unhealthy_threshold
    timeout             = each.value.health_check.timeout
    interval            = each.value.health_check.interval
    path                = each.value.health_check.path
    matcher             = each.value.health_check.matcher
  }

  tags = merge(
    var.common_tags,
    {
      Name = each.value.name
    }
  )
}

resource "aws_lb_listener" "listeners" {
  for_each = var.listeners

  load_balancer_arn = aws_lb.alb.arn
  port              = each.value.port
  protocol          = each.value.protocol
  ssl_policy        = each.value.ssl_policy
  certificate_arn   = each.value.certificate_arn

  default_action {
    type             = each.value.default_action_type
    target_group_arn = can(each.value.target_group_key) ? aws_lb_target_group.target_groups[each.value.target_group_key].arn : null
  }
}

resource "aws_lb_target_group_attachment" "attachments" {
  for_each = var.target_attachments != null ? {
    for attachment in var.target_attachments : "${attachment.target_group_key}-${attachment.target_id}" => attachment
  } : {}

  target_group_arn = aws_lb_target_group.target_groups[each.value.target_group_key].arn
  target_id        = each.value.target_id
  port             = each.value.port
}
