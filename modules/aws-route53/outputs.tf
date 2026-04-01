output "zone_id" {
  description = "The Zone ID of the Route53 zone"
  value       = aws_route53_zone.zone.zone_id
}

output "zone_name" {
  description = "The name of the Route53 zone"
  value       = aws_route53_zone.zone.name
}

output "zone_name_servers" {
  description = "The name servers for the zone"
  value       = aws_route53_zone.zone.name_servers
}

output "record_fqdns" {
  description = "Map of record names to their FQDNs"
  value       = { for k, record in aws_route53_record.records : k => record.fqdn }
}

output "health_check_ids" {
  description = "Map of health check names to IDs"
  value       = { for k, hc in aws_route53_health_check.health_checks : k => hc.id }
}
