# AWS VPN Module

Creates site-to-site VPN connections for on-premises connectivity.

## Usage

```hcl
module "vpn" {
  source = "./modules/aws-vpn"

  gateway_name      = "office-gateway"
  vpn_gateway_name  = "main-vpn-gateway"
  connection_name   = "office-connection"

  ip_address = "203.0.113.1"
  vpc_id     = aws_vpc.main.id

  static_routes_only = true

  vpn_routes = {
    office_network = "192.168.0.0/16"
  }

  route_table_ids = [aws_route_table.private.id]

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `gateway_name` - Customer gateway name (required)
- `vpn_gateway_name` - VPN gateway name (required)
- `connection_name` - Connection name (required)
- `ip_address` - Customer gateway IP (required)
- `vpc_id` - VPC ID (required)
- `bgp_asn` - BGP ASN (default: 65000)
- `static_routes_only` - Use static routing (default: true)
- `vpn_routes` - CIDR blocks to route through VPN

## Outputs

- `customer_gateway_id` - Customer gateway ID
- `vpn_gateway_id` - VPN gateway ID
- `vpn_connection_id` - VPN connection ID
- `vpn_connection_tunnel1_address` - Tunnel 1 address
- `vpn_connection_tunnel2_address` - Tunnel 2 address
