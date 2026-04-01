# AWS Security Group Module

This module creates and manages AWS security groups with ingress and egress rules.

## Usage

```hcl
module "web_sg" {
  source = "./modules/aws-security-group"

  name_prefix = "web"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.main.id

  ingress_rules = [
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    },
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}
```

## Inputs

- `name_prefix` - Name prefix for the security group (required)
- `description` - Security group description
- `vpc_id` - VPC ID (required)
- `ingress_rules` - List of ingress rules
- `egress_rules` - List of egress rules

## Outputs

- `security_group_id` - The security group ID
- `security_group_arn` - The security group ARN
- `security_group_name` - The security group name
