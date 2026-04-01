variable "name_prefix" {
  description = "Name prefix for the security group"
  type        = string
  nullable    = false
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "Security group"
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
  nullable    = false
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    security_group_id = optional(string)
    description     = optional(string, "")
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string), ["0.0.0.0/0"])
    ipv6_cidr_blocks = optional(list(string))
    security_group_id = optional(string)
    description     = optional(string, "")
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
