variable "name" {
  description = "Auto Scaling Group name"
  type        = string
  nullable    = false
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs"
  type        = list(string)
  nullable    = false
}

variable "min_size" {
  description = "Minimum size"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity"
  type        = number
  default     = 2
}

variable "health_check_type" {
  description = "Health check type (EC2 or ELB)"
  type        = string
  default     = "ELB"
}

variable "health_check_grace_period" {
  description = "Grace period in seconds"
  type        = number
  default     = 300
}

variable "default_cooldown" {
  description = "Default cooldown in seconds"
  type        = number
  default     = 300
}

variable "launch_template_id" {
  description = "Launch template ID"
  type        = string
  nullable    = false
}

variable "launch_template_version" {
  description = "Launch template version"
  type        = string
  default     = "$Latest"
}

variable "target_group_arns" {
  description = "Target group ARNs"
  type        = list(string)
  default     = []
}

variable "termination_policies" {
  description = "Termination policies"
  type        = list(string)
  default     = ["Default"]
}

variable "scaling_policies" {
  description = "Map of scaling policies"
  type = map(object({
    adjustment_type    = string
    scaling_adjustment = number
    cooldown           = optional(number, 300)
  }))
  default = {}
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
