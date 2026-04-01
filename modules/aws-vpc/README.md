# AWS VPC Module

This module provides a reusable way to create and configure a VPC with public and private subnets, internet gateway, and NAT gateways.

## Usage

```hcl
module "vpc" {
  source = "./modules/aws-vpc"

  vpc_name           = "main"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]

  enable_nat_gateway = true

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `vpc_name` - The name of the VPC (required)
- `cidr_block` - CIDR block for the VPC (default: 10.0.0.0/16)
- `availability_zones` - List of availability zones (required)
- `public_subnets` - List of public subnet CIDR blocks
- `private_subnets` - List of private subnet CIDR blocks
- `enable_nat_gateway` - Enable NAT gateway (default: true)
- `enable_dns_hostnames` - Enable DNS hostnames (default: true)
- `enable_dns_support` - Enable DNS support (default: true)
- `map_public_ip_on_launch` - Auto-assign public IPs in public subnets (default: true)

## Outputs

- `vpc_id` - The VPC ID
- `vpc_cidr` - The VPC CIDR block
- `public_subnet_ids` - List of public subnet IDs
- `private_subnet_ids` - List of private subnet IDs
- `internet_gateway_id` - The internet gateway ID
- `nat_gateway_ids` - List of NAT gateway IDs
- `public_route_table_id` - The public route table ID
- `private_route_table_ids` - List of private route table IDs
