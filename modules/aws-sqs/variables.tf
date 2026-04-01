variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
  nullable    = false
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout in seconds"
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "Message retention in seconds"
  type        = number
  default     = 345600
}

variable "delay_seconds" {
  description = "Delay for delivering messages in seconds"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Maximum message size in bytes"
  type        = number
  default     = 262144
}

variable "receive_wait_time_seconds" {
  description = "Long polling wait time in seconds"
  type        = number
  default     = 0
}

variable "kms_master_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "fifo_queue" {
  description = "Whether to create a FIFO queue"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO queues"
  type        = bool
  default     = false
}

variable "queue_policy" {
  description = "SQS queue policy"
  type        = any
  default     = null
}

variable "redrive_policy" {
  description = "Dead letter queue redrive policy"
  type        = any
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
