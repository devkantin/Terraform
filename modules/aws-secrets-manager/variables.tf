variable "name_prefix" {
  description = "Name prefix for the secret"
  type        = string
  nullable    = false
}

variable "description" {
  description = "Description of the secret"
  type        = string
  default     = "Secret"
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "recovery_window_in_days" {
  description = "Recovery window in days"
  type        = number
  default     = 7
}

variable "secret_value" {
  description = "The secret value"
  type        = string
  default     = null
  sensitive   = true
}

variable "secret_policy" {
  description = "Secret policy document"
  type        = any
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
