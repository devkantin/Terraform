variable "trail_name" {
  description = "CloudTrail trail name"
  type        = string
  nullable    = false
}

variable "s3_bucket_name" {
  description = "S3 bucket for CloudTrail logs"
  type        = string
  nullable    = false
}

variable "is_multi_region_trail" {
  description = "Multi-region trail"
  type        = bool
  default     = true
}

variable "enable_log_file_validation" {
  description = "Enable log file validation"
  type        = bool
  default     = true
}

variable "include_global_service_events" {
  description = "Include CloudFront and IAM events"
  type        = bool
  default     = true
}

variable "is_organization_trail" {
  description = "Organization trail"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "event_selector_read_write_type" {
  description = "Read/write type (All, ReadOnly, WriteOnly)"
  type        = string
  default     = "All"
}

variable "include_management_events" {
  description = "Include management events"
  type        = bool
  default     = true
}

variable "data_resources" {
  description = "Data resources to log"
  type = list(object({
    type   = string
    values = list(string)
  }))
  default = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
