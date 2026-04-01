# AWS VPC Peering Module

Creates VPC peering connections with route and DNS configuration.

## Usage

```hcl
module "vpc_peering" {
  source = "./modules/aws-vpc-peering"

  peering_name = "main-to-secondary"
  vpc_id       = aws_vpc.main.id
  peer_vpc_id  = aws_vpc.secondary.id
  auto_accept  = true

  configure_options = true
  accepter_allow_remote_vpc_dns_resolution = true
  requester_allow_remote_vpc_dns_resolution = true

  requester_routes = {
    to_secondary = {
      route_table_id         = aws_route_table.main.id
      destination_cidr_block = aws_vpc.secondary.cidr_block
    }
  }
}
```

## Inputs

- `peering_name` - Connection name (required)
- `vpc_id` - Requester VPC ID (required)
- `peer_vpc_id` - Accepter VPC ID (required)
- `auto_accept` - Auto-accept (default: false)
- `peer_region` - Peer region for cross-region peering
- `requester_routes` - Routes for requester VPC
- `accepter_routes` - Routes for accepter VPC

## Outputs

- `peering_connection_id` - The peering connection ID
- `peering_connection_status` - The connection status
