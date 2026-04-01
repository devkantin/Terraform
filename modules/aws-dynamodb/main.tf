resource "aws_dynamodb_table" "table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

  stream_specification {
    stream_enabled   = var.stream_enabled
    stream_view_type = var.stream_view_type
  }

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indexes
    content {
      name            = global_secondary_index.value.name
      hash_key        = global_secondary_index.value.hash_key
      range_key       = global_secondary_index.value.range_key
      read_capacity   = var.billing_mode == "PROVISIONED" ? global_secondary_index.value.read_capacity : null
      write_capacity  = var.billing_mode == "PROVISIONED" ? global_secondary_index.value.write_capacity : null
      projection_type = global_secondary_index.value.projection_type
    }
  }

  ttl {
    attribute_name = var.ttl_attribute_name
    enabled        = var.ttl_enabled
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery_enabled
  }

  server_side_encryption {
    enabled     = var.encryption_enabled
    kms_key_arn = var.kms_key_arn
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.table_name
    }
  )
}
