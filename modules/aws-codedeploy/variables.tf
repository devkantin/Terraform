variable "app_name" {
  description = "CodeDeploy application name"
  type        = string
  nullable    = false
}

variable "compute_platform" {
  description = "Compute platform (Server, Lambda, OnPremises)"
  type        = string
  default     = "Server"
}

variable "deployment_group_name" {
  description = "Deployment group name"
  type        = string
  nullable    = false
}

variable "service_role_arn" {
  description = "Service role ARN"
  type        = string
  nullable    = false
}

variable "deployment_config_name" {
  description = "Deployment config (CodeDeployDefault.*)"
  type        = string
  default     = "CodeDeployDefault.AllAtOnce"
}

variable "deployment_type" {
  description = "Deployment type (in-place, blue-green)"
  type        = string
  default     = "in-place"
}

variable "auto_rollback_enabled" {
  description = "Enable automatic rollback"
  type        = bool
  default     = true
}

variable "auto_rollback_events" {
  description = "Rollback events"
  type        = list(string)
  default     = ["DEPLOYMENT_FAILURE", "DEPLOYMENT_STOP_ON_TIMEOUT"]
}

variable "target_group_name" {
  description = "Target group name"
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
