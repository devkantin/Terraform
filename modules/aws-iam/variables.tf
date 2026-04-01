variable "role_name" {
  description = "The name of the IAM role"
  type        = string
  nullable    = false
}

variable "assume_role_policy" {
  description = "The assume role policy document"
  type        = any
  nullable    = false
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "Map of inline policy names to policy documents"
  type        = map(any)
  default     = {}
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile for the role"
  type        = bool
  default     = true
}

variable "create_users" {
  description = "Whether to create IAM users"
  type        = bool
  default     = false
}

variable "user_names" {
  description = "List of IAM user names to create"
  type        = list(string)
  default     = []
}

variable "user_managed_policy_arns" {
  description = "List of managed policy ARNs to attach to users"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
