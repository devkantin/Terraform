resource "aws_docdb_cluster" "cluster" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "docdb"
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.cluster_identifier}-final-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"

  storage_encrypted          = var.storage_encrypted
  kms_key_id                 = var.kms_key_id
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name

  tags = merge(
    var.common_tags,
    {
      Name = var.cluster_identifier
    }
  )
}

resource "aws_docdb_cluster_instance" "instances" {
  count              = var.num_instances
  identifier         = "${var.cluster_identifier}-${count.index + 1}"
  cluster_identifier = aws_docdb_cluster.cluster.id
  instance_class     = var.instance_class
  engine              = "docdb"

  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  tags = merge(
    var.common_tags,
    {
      Name = "${var.cluster_identifier}-${count.index + 1}"
    }
  )
}

resource "aws_docdb_subnet_group" "subnet_group" {
  count           = var.create_subnet_group ? 1 : 0
  name            = var.db_subnet_group_name
  subnet_ids      = var.subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = var.db_subnet_group_name
    }
  )
}
