variable "gateway_name" {
  description = "Customer gateway name"
  type        = string
  nullable    = false
}

variable "vpn_gateway_name" {
  description = "VPN gateway name"
  type        = string
  nullable    = false
}

variable "connection_name" {
  description = "VPN connection name"
  type        = string
  nullable    = false
}

variable "bgp_asn" {
  description = "BGP ASN of the customer gateway"
  type        = number
  default     = 65000
}

variable "public_ip" {
  description = "Public IP of the customer gateway"
  type        = string
  default     = null
}

variable "type" {
  description = "Type of customer gateway (ipsec.1, ipv6)"
  type        = string
  default     = "ipsec.1"
}

variable "ip_address" {
  description = "IP address of the customer gateway"
  type        = string
  nullable    = false
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  nullable    = false
}

variable "amazon_side_asn" {
  description = "Amazon side ASN"
  type        = number
  default     = 64512
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
  default     = null
}

variable "static_routes_only" {
  description = "Use static routing"
  type        = bool
  default     = true
}

variable "vpn_routes" {
  description = "Map of CIDR blocks to route through VPN"
  type        = map(string)
  default     = {}
}

variable "route_table_ids" {
  description = "Route table IDs for route propagation"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
