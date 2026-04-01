variable "alb_name" {
  description = "The name of the load balancer"
  type        = string
  nullable    = false
}

variable "internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
  nullable    = false
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
  nullable    = false
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "enable_http2" {
  description = "Enable HTTP/2"
  type        = bool
  default     = true
}

variable "enable_cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The VPC ID for target groups"
  type        = string
  nullable    = false
}

variable "target_groups" {
  description = "Map of target group configurations"
  type = map(object({
    name        = string
    port        = number
    protocol    = string
    target_type = optional(string, "instance")
    health_check = object({
      healthy_threshold   = optional(number, 2)
      unhealthy_threshold = optional(number, 2)
      timeout             = optional(number, 5)
      interval            = optional(number, 30)
      path                = optional(string, "/")
      matcher             = optional(string, "200")
    })
  }))
  default = {}
}

variable "listeners" {
  description = "Map of listener configurations"
  type = map(object({
    port                = number
    protocol            = string
    ssl_policy          = optional(string)
    certificate_arn     = optional(string)
    default_action_type = optional(string, "forward")
    target_group_key    = optional(string)
  }))
  default = {}
}

variable "target_attachments" {
  description = "List of target attachments"
  type = list(object({
    target_group_key = string
    target_id        = string
    port             = optional(number)
  }))
  default = null
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
