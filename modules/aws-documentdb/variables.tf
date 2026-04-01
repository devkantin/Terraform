variable "cluster_identifier" {
  description = "Cluster identifier"
  type        = string
  nullable    = false
}

variable "master_username" {
  description = "Master username"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "master_password" {
  description = "Master password"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "03:00-04:00"
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Enable storage encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID"
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
  default     = ["audit", "error", "general", "slowlog"]
}

variable "vpc_security_group_ids" {
  description = "VPC security group IDs"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
  default     = null
}

variable "create_subnet_group" {
  description = "Create subnet group"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
  default     = []
}

variable "num_instances" {
  description = "Number of instances"
  type        = number
  default     = 3
}

variable "instance_class" {
  description = "Instance class"
  type        = string
  default     = "db.t3.small"
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrade"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
