variable "repository_name" {
  description = "ECR repository name"
  type        = string
  nullable    = false
}

variable "image_tag_mutability" {
  description = "Image tag mutability (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "Encryption type (AES256 or KMS)"
  type        = string
  default     = "AES256"
}

variable "kms_key" {
  description = "KMS key for encryption"
  type        = string
  default     = null
}

variable "repository_policy" {
  description = "Repository policy"
  type        = any
  default     = null
}

variable "lifecycle_policy" {
  description = "Lifecycle policy"
  type        = any
  default     = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
