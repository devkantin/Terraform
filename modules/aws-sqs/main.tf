resource "aws_sqs_queue" "queue" {
  name                       = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  receive_wait_time_seconds  = var.receive_wait_time_seconds

  kms_master_key_id = var.kms_master_key_id

  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  tags = merge(
    var.common_tags,
    {
      Name = var.queue_name
    }
  )
}

resource "aws_sqs_queue_policy" "policy" {
  count     = var.queue_policy != null ? 1 : 0
  queue_url = aws_sqs_queue.queue.id
  policy    = jsonencode(var.queue_policy)
}

resource "aws_sqs_queue_redrive_policy" "redrive" {
  count            = var.redrive_policy != null ? 1 : 0
  queue_url        = aws_sqs_queue.queue.id
  redrive_policy   = jsonencode(var.redrive_policy)
}
