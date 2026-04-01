resource "aws_cloudwatch_log_group" "log_group" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = merge(
    var.common_tags,
    {
      Name = var.log_group_name
    }
  )
}

resource "aws_cloudwatch_metric_alarm" "alarms" {
  for_each = var.metric_alarms

  alarm_name          = each.value.alarm_name
  comparison_operator = each.value.comparison_operator
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = each.value.metric_name
  namespace           = each.value.namespace
  period              = each.value.period
  statistic           = each.value.statistic
  threshold           = each.value.threshold
  alarm_description   = each.value.alarm_description
  alarm_actions       = each.value.alarm_actions
  ok_actions          = each.value.ok_actions
  insufficient_data_actions = each.value.insufficient_data_actions

  dimensions = each.value.dimensions

  tags = merge(
    var.common_tags,
    {
      Name = each.value.alarm_name
    }
  )
}

resource "aws_cloudwatch_log_resource_policy" "resource_policy" {
  count = var.create_log_resource_policy ? 1 : 0

  policy_name     = var.log_resource_policy_name
  policy_text     = jsonencode(var.log_resource_policy)
}

resource "aws_cloudwatch_dashboard" "dashboard" {
  count          = var.create_dashboard ? 1 : 0
  dashboard_name = var.dashboard_name
  dashboard_body = jsonencode(var.dashboard_body)
}
