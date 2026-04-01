variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  nullable    = false
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "enable_encryption" {
  description = "Enable server-side encryption"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "The server-side encryption algorithm to use"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256", "aws:kms"], var.encryption_algorithm)
    error_message = "Encryption algorithm must be 'AES256' or 'aws:kms'."
  }
}

variable "block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Block public bucket policy"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Ignore existing public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Restrict public bucket access"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Enable S3 access logging"
  type        = bool
  default     = false
}

variable "logging_bucket" {
  description = "The target bucket for logging"
  type        = string
  default     = ""
}

variable "logging_prefix" {
  description = "The prefix for logging objects"
  type        = string
  default     = "logs/"
}

variable "enable_lifecycle" {
  description = "Enable lifecycle configuration"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "Lifecycle rules for the bucket"
  type = list(object({
    id                         = string
    status                     = string
    expiration                 = optional(object({ days = number }))
    noncurrent_version_expiration = optional(object({ noncurrent_days = number }))
  }))
  default = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
