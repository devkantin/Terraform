resource "aws_route53_zone" "zone" {
  name = var.zone_name

  tags = merge(
    var.common_tags,
    {
      Name = var.zone_name
    }
  )
}

resource "aws_route53_record" "records" {
  for_each = var.records

  zone_id = aws_route53_zone.zone.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = each.value.ttl
  records = each.value.records

  set_identifier = each.value.set_identifier
  failover_routing_policy {
    type = each.value.failover_routing_policy
  }
  weighted_routing_policy {
    weight = each.value.weighted_routing_policy_weight
  }
  geolocation_routing_policy {
    continent       = each.value.geolocation_continent
    country         = each.value.geolocation_country
    subdivision     = each.value.geolocation_subdivision
  }
}

resource "aws_route53_health_check" "health_checks" {
  for_each = var.health_checks

  ip_address        = each.value.ip_address
  port              = each.value.port
  type              = each.value.type
  resource_path     = each.value.resource_path
  failure_threshold = each.value.failure_threshold
  request_interval  = each.value.request_interval

  tags = merge(
    var.common_tags,
    {
      Name = each.key
    }
  )
}
