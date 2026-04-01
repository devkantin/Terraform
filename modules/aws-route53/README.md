# AWS Route53 Module

Manages Route53 hosted zones, DNS records, and health checks.

## Usage

```hcl
module "route53" {
  source = "./modules/aws-route53"

  zone_name = "example.com"

  records = {
    www = {
      name    = "www.example.com"
      type    = "A"
      ttl     = 300
      records = ["192.0.2.1"]
    }
    apex = {
      name    = "example.com"
      type    = "A"
      ttl     = 300
      records = ["192.0.2.1"]
    }
  }

  health_checks = {
    web_server = {
      ip_address   = "192.0.2.1"
      port         = 80
      type         = "HTTP"
      resource_path = "/"
    }
  }
}
```

## Inputs

- `zone_name` - Route53 zone name (required)
- `records` - Map of DNS records
- `health_checks` - Map of health checks

## Outputs

- `zone_id` - The zone ID
- `zone_name` - The zone name
- `zone_name_servers` - The name servers
- `record_fqdns` - Map of record FQDNs
- `health_check_ids` - Map of health check IDs
