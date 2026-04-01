variable "peering_name" {
  description = "Name of the peering connection"
  type        = string
  nullable    = false
}

variable "vpc_id" {
  description = "Requester VPC ID"
  type        = string
  nullable    = false
}

variable "peer_vpc_id" {
  description = "Accepter VPC ID"
  type        = string
  nullable    = false
}

variable "peer_owner_id" {
  description = "AWS account ID of peer VPC owner"
  type        = string
  default     = null
}

variable "peer_region" {
  description = "Region of the accepter VPC"
  type        = string
  default     = null
}

variable "auto_accept" {
  description = "Automatically accept the peering connection"
  type        = bool
  default     = false
}

variable "accepter_enabled" {
  description = "Enable accepter configuration"
  type        = bool
  default     = false
}

variable "accepter_auto_accept" {
  description = "Automatically accept peering in accepter"
  type        = bool
  default     = false
}

variable "configure_options" {
  description = "Configure peering options"
  type        = bool
  default     = false
}

variable "accepter_allow_remote_vpc_dns_resolution" {
  description = "Allow DNS resolution in accepter"
  type        = bool
  default     = true
}

variable "requester_allow_remote_vpc_dns_resolution" {
  description = "Allow DNS resolution in requester"
  type        = bool
  default     = true
}

variable "requester_routes" {
  description = "Routes for requester VPC"
  type = map(object({
    route_table_id         = string
    destination_cidr_block = string
  }))
  default = {}
}

variable "accepter_routes" {
  description = "Routes for accepter VPC"
  type = map(object({
    route_table_id         = string
    destination_cidr_block = string
  }))
  default = {}
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
