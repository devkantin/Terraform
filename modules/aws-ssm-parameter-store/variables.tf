variable "parameters" {
  description = "Map of SSM parameters"
  type = map(object({
    name        = string
    type        = string
    value       = string
    description = optional(string, "")
    tier        = optional(string, "Standard")
    key_id      = optional(string)
  }))
  nullable = false
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
