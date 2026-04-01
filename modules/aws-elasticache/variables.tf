variable "cluster_id" {
  description = "Cluster identifier"
  type        = string
  nullable    = false
}

variable "engine" {
  description = "Engine type (redis, memcached)"
  type        = string
  default     = "redis"
}

variable "node_type" {
  description = "Node type (e.g., cache.t3.micro)"
  type        = string
  nullable    = false
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
  default     = 1
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "Parameter group name"
  type        = string
  default     = null
}

variable "port" {
  description = "Port number"
  type        = number
  default     = 6379
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "subnet_group_name" {
  description = "Subnet group name"
  type        = string
  default     = null
}

variable "create_subnet_group" {
  description = "Create subnet group"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "Subnet IDs for subnet group"
  type        = list(string)
  default     = []
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrade"
  type        = bool
  default     = true
}

variable "maintenance_window" {
  description = "Maintenance window"
  type        = string
  default     = "sun:05:00-sun:07:00"
}

variable "snapshot_retention_limit" {
  description = "Snapshot retention limit"
  type        = number
  default     = 0
}

variable "snapshot_window" {
  description = "Snapshot window"
  type        = string
  default     = ""
}

variable "at_rest_encryption_enabled" {
  description = "Enable at-rest encryption"
  type        = bool
  default     = true
}

variable "transit_encryption_enabled" {
  description = "Enable transit encryption"
  type        = bool
  default     = true
}

variable "notification_topic_arn" {
  description = "SNS topic ARN for notifications"
  type        = string
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
