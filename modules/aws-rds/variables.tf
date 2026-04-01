variable "instance_identifier" {
  description = "The name of the RDS instance"
  type        = string
  nullable    = false
}

variable "engine" {
  description = "The database engine (mysql, postgresql, mariadb, oracle-se2, sqlserver-ex)"
  type        = string
  nullable    = false
  validation {
    condition     = contains(["mysql", "postgresql", "mariadb", "oracle-se2", "sqlserver-ex"], var.engine)
    error_message = "Engine must be one of: mysql, postgresql, mariadb, oracle-se2, sqlserver-ex"
  }
}

variable "engine_version" {
  description = "The database engine version"
  type        = string
  nullable    = false
}

variable "instance_class" {
  description = "The instance class/type"
  type        = string
  default     = "db.t3.micro"
}

variable "database_name" {
  description = "The initial database name"
  type        = string
  default     = "mydb"
}

variable "database_username" {
  description = "The master username for the database"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "database_password" {
  description = "The master password for the database"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "Storage type (gp2, gp3, io1, io2)"
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Enable storage encryption"
  type        = bool
  default     = true
}

variable "iops" {
  description = "Amount of provisioned IOPS"
  type        = number
  default     = 3000
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
  default     = null
}

variable "publicly_accessible" {
  description = "Enable public accessibility"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when deleting the database"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Backup window in UTC (hh24:mi-hh24:mi format)"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "Maintenance window (ddd:hh24:mi-ddd:hh24:mi format)"
  type        = string
  default     = "sun:04:00-sun:05:00"
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades"
  type        = bool
  default     = true
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "depends_on" {
  description = "Dependencies for resource creation"
  type        = list(any)
  default     = []
}
