# AWS EC2 Module

This module provides a reusable way to create an EC2 instance on AWS.

## Usage

```hcl
module "ec2_instance" {
  source = "./modules/aws-ec2"

  ami_id           = "ami-0c55b159cbfafe1f0"
  instance_type    = "t3.micro"
  instance_name    = "my-instance"
  subnet_id        = aws_subnet.main.id
  security_group_ids = [aws_security_group.main.id]
  
  common_tags = {
    Environment = "production"
    Team        = "platform"
  }
}
```

## Inputs

- `ami_id` - The ID of the AMI to launch (required)
- `instance_type` - The type of instance to launch (default: t3.micro)
- `instance_name` - The name of the instance (required)
- `key_name` - The key pair name for SSH access
- `subnet_id` - The VPC subnet ID (required)
- `security_group_ids` - List of security group IDs
- `associate_public_ip` - Whether to associate a public IP (default: false)
- `root_volume_size` - Size of root volume in GB (default: 20)
- `ebs_encrypted` - Enable EBS encryption (default: true)

## Outputs

- `instance_id` - The EC2 instance ID
- `instance_public_ip` - Public IP address of the instance
- `instance_private_ip` - Private IP address of the instance
- `instance_arn` - ARN of the instance
