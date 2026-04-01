variable "log_group_name" {
  description = "Name of the CloudWatch log group"
  type        = string
  nullable    = false
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events"
  type        = number
  default     = 7
  validation {
    condition     = contains([0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653], var.retention_in_days)
    error_message = "Valid values are 0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653"
  }
}

variable "kms_key_id" {
  description = "ARN of the KMS key to use for encryption"
  type        = string
  default     = null
}

variable "metric_alarms" {
  description = "Map of CloudWatch metric alarms"
  type = map(object({
    alarm_name          = string
    comparison_operator = string
    evaluation_periods  = number
    metric_name         = string
    namespace           = string
    period              = number
    statistic           = string
    threshold           = number
    alarm_description   = optional(string, "")
    alarm_actions       = optional(list(string), [])
    ok_actions          = optional(list(string), [])
    insufficient_data_actions = optional(list(string), [])
    dimensions          = optional(map(string), {})
  }))
  default = {}
}

variable "create_log_resource_policy" {
  description = "Whether to create a log resource policy"
  type        = bool
  default     = false
}

variable "log_resource_policy_name" {
  description = "Name of the log resource policy"
  type        = string
  default     = ""
}

variable "log_resource_policy" {
  description = "Log resource policy document"
  type        = any
  default     = {}
}

variable "create_dashboard" {
  description = "Whether to create a CloudWatch dashboard"
  type        = bool
  default     = false
}

variable "dashboard_name" {
  description = "Name of the dashboard"
  type        = string
  default     = ""
}

variable "dashboard_body" {
  description = "The dashboard body as a map"
  type        = any
  default     = {}
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
