resource "aws_sns_topic" "topic" {
  name              = var.topic_name
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  fifo_topic        = var.fifo_topic
  content_based_deduplication = var.content_based_deduplication

  tags = merge(
    var.common_tags,
    {
      Name = var.topic_name
    }
  )
}

resource "aws_sns_topic_policy" "policy" {
  count  = var.topic_policy != null ? 1 : 0
  arn    = aws_sns_topic.topic.arn
  policy = jsonencode(var.topic_policy)
}

resource "aws_sns_topic_subscription" "subscriptions" {
  for_each = var.subscriptions

  topic_arn = aws_sns_topic.topic.arn
  protocol  = each.value.protocol
  endpoint  = each.value.endpoint
  filter_policies = each.value.filter_policies
}
