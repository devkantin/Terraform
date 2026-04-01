variable "key_name" {
  description = "Name for the KMS key"
  type        = string
  nullable    = false
}

variable "description" {
  description = "Description of the KMS key"
  type        = string
  default     = "KMS key"
}

variable "deletion_window_in_days" {
  description = "Deletion window in days"
  type        = number
  default     = 10
}

variable "enable_key_rotation" {
  description = "Enable automatic key rotation"
  type        = bool
  default     = true
}

variable "multi_region" {
  description = "Create multi-region key"
  type        = bool
  default     = false
}

variable "replica_regions" {
  description = "Regions for key replicas"
  type        = list(string)
  default     = []
}

variable "key_policy" {
  description = "KMS key policy"
  type        = any
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
