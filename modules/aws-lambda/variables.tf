variable "filename" {
  description = "Path to the Lambda function code archive"
  type        = string
  nullable    = false
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  nullable    = false
}

variable "role_arn" {
  description = "IAM role ARN for the Lambda function"
  type        = string
  nullable    = false
}

variable "handler" {
  description = "Lambda handler (e.g., index.handler)"
  type        = string
  nullable    = false
}

variable "runtime" {
  description = "Lambda runtime (e.g., python3.11, nodejs18.x, go1.x)"
  type        = string
  nullable    = false
}

variable "timeout" {
  description = "Function timeout in seconds"
  type        = number
  default     = 60
}

variable "memory_size" {
  description = "Memory allocation in MB"
  type        = number
  default     = 128
}

variable "source_code_hash" {
  description = "Hash of the source code for change detection"
  type        = string
  default     = ""
}

variable "vpc_config" {
  description = "VPC configuration for the function"
  type = object({
    subnet_ids         = list(string)
    security_group_ids = list(string)
  })
  default = {
    subnet_ids         = []
    security_group_ids = []
  }
}

variable "subnet_ids" {
  description = "List of subnet IDs (deprecated, use vpc_config)"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security group IDs (deprecated, use vpc_config)"
  type        = list(string)
  default     = []
}

variable "environment_variables" {
  description = "Environment variables for the function"
  type        = map(string)
  default     = {}
}

variable "lambda_layers" {
  description = "List of Lambda layer ARNs"
  type        = list(string)
  default     = []
}

variable "lambda_permissions" {
  description = "Map of Lambda permissions"
  type = map(object({
    statement_id = string
    action       = string
    principal    = string
    source_arn   = optional(string)
  }))
  default = {}
}

variable "lambda_aliases" {
  description = "Map of Lambda aliases"
  type = map(object({
    description   = optional(string, "")
    routing_config = optional(map(string), {})
  }))
  default = {}
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "depends_on" {
  description = "Dependencies for resource creation"
  type        = list(any)
  default     = []
}
