variable "table_name" {
  description = "DynamoDB table name"
  type        = string
  nullable    = false
}

variable "billing_mode" {
  description = "Billing mode (PAY_PER_REQUEST or PROVISIONED)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Hash key attribute name"
  type        = string
  nullable    = false
}

variable "range_key" {
  description = "Range key attribute name"
  type        = string
  default     = null
}

variable "read_capacity" {
  description = "Provisioned read capacity"
  type        = number
  default     = 0
}

variable "write_capacity" {
  description = "Provisioned write capacity"
  type        = number
  default     = 0
}

variable "attributes" {
  description = "Table attributes"
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "global_secondary_indexes" {
  description = "Global secondary indexes"
  type = list(object({
    name              = string
    hash_key          = string
    range_key         = optional(string)
    read_capacity     = optional(number, 0)
    write_capacity    = optional(number, 0)
    projection_type   = optional(string, "ALL")
  }))
  default = []
}

variable "stream_enabled" {
  description = "Enable streams"
  type        = bool
  default     = true
}

variable "stream_view_type" {
  description = "Stream view type (NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES, KEYS_ONLY)"
  type        = string
  default     = "NEW_AND_OLD_IMAGES"
}

variable "ttl_enabled" {
  description = "Enable TTL"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "TTL attribute name"
  type        = string
  default     = ""
}

variable "point_in_time_recovery_enabled" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "encryption_enabled" {
  description = "Enable encryption"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "KMS key ARN for encryption"
  type        = string
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
