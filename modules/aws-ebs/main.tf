resource "aws_ebs_volume" "volume" {
  availability_zone = var.availability_zone
  size              = var.size
  iops              = var.iops
  throughput        = var.throughput
  volume_type       = var.volume_type
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id

  tags = merge(
    var.common_tags,
    {
      Name = var.volume_name
    }
  )
}

resource "aws_volume_attachment" "attachment" {
  count           = var.instance_id != null ? 1 : 0
  device_name     = var.device_name
  volume_id       = aws_ebs_volume.volume.id
  instance_id     = var.instance_id
}

resource "aws_ebs_snapshot" "snapshot" {
  count       = var.create_snapshot ? 1 : 0
  volume_id   = aws_ebs_volume.volume.id
  description = var.snapshot_description

  tags = merge(
    var.common_tags,
    {
      Name = "${var.volume_name}-snapshot"
    }
  )
}
