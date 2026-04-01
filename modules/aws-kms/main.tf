resource "aws_kms_key" "key" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  multi_region            = var.multi_region

  tags = merge(
    var.common_tags,
    {
      Name = var.key_name
    }
  )
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.key.key_id
}

resource "aws_kms_key_policy" "policy" {
  count     = var.key_policy != null ? 1 : 0
  key_id    = aws_kms_key.key.id
  policy    = jsonencode(var.key_policy)
}

resource "aws_kms_replica_key" "replica" {
  for_each = toset(var.replica_regions)

  description             = "${var.description} (Replica in ${each.value})"
  primary_key_id          = aws_kms_key.key.id
  deletion_window_in_days = var.deletion_window_in_days
}
