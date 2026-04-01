variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
  nullable    = false
}

variable "container_insights_enabled" {
  description = "Enable Container Insights"
  type        = bool
  default     = true
}

variable "task_family" {
  description = "ECS task definition family"
  type        = string
  nullable    = false
}

variable "network_mode" {
  description = "Network mode (bridge, host, awsvpc, none)"
  type        = string
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Task compatibility (EC2, FARGATE, EXTERNAL)"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "cpu" {
  description = "CPU units (required for FARGATE)"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory in MB (required for FARGATE)"
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "Execution role ARN"
  type        = string
  nullable    = false
}

variable "task_role_arn" {
  description = "Task role ARN"
  type        = string
  default     = null
}

variable "container_definitions" {
  description = "Container definitions"
  type        = any
  nullable    = false
}

variable "create_service" {
  description = "Create ECS service"
  type        = bool
  default     = true
}

variable "service_name" {
  description = "ECS service name"
  type        = string
  default     = ""
}

variable "desired_count" {
  description = "Desired count of tasks"
  type        = number
  default     = 1
}

variable "launch_type" {
  description = "Launch type (EC2, FARGATE, EXTERNAL)"
  type        = string
  default     = "FARGATE"
}

variable "subnet_ids" {
  description = "Subnet IDs for service"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = []
}

variable "assign_public_ip" {
  description = "Assign public IP"
  type        = bool
  default     = false
}

variable "target_group_arn" {
  description = "Target group ARN"
  type        = string
  default     = null
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = ""
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
