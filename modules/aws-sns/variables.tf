variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
  nullable    = false
}

variable "display_name" {
  description = "Display name for the topic"
  type        = string
  default     = ""
}

variable "kms_master_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Whether to create a FIFO topic"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO topics"
  type        = bool
  default     = false
}

variable "topic_policy" {
  description = "SNS topic policy"
  type        = any
  default     = null
}

variable "subscriptions" {
  description = "Map of SNS subscriptions"
  type = map(object({
    protocol        = string
    endpoint        = string
    filter_policies = optional(map(any), {})
  }))
  default = {}
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
