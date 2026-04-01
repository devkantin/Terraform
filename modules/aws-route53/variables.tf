variable "zone_name" {
  description = "The name of the Route53 zone"
  type        = string
  nullable    = false
}

variable "records" {
  description = "Map of Route53 records"
  type = map(object({
    name                            = string
    type                            = string
    ttl                             = optional(number, 300)
    records                         = optional(list(string), [])
    set_identifier                  = optional(string)
    failover_routing_policy         = optional(string)
    weighted_routing_policy_weight  = optional(number)
    geolocation_continent           = optional(string)
    geolocation_country             = optional(string)
    geolocation_subdivision         = optional(string)
  }))
  default = {}
}

variable "health_checks" {
  description = "Map of Route53 health checks"
  type = map(object({
    ip_address        = string
    port              = number
    type              = string
    resource_path     = optional(string)
    failure_threshold = optional(number, 3)
    request_interval  = optional(number, 30)
  }))
  default = {}
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
