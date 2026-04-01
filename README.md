# AWS Infrastructure Terraform Modules

A collection of reusable Terraform modules for provisioning AWS infrastructure components.

## Modules

### 1. AWS EC2 (`modules/aws-ec2`)
Provisions EC2 instances with configurable settings for compute workloads.

**Key Features:**
- Flexible instance types and sizing
- Built-in EBS encryption
- IAM instance profile support
- User data support
- Security group integration
- CloudWatch detailed monitoring

**Usage:**
```hcl
module "web_server" {
  source = "./modules/aws-ec2"
  
  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.small"
  instance_name = "web-server-1"
  # ... additional configuration
}
```

### 2. AWS S3 (`modules/aws-s3`)
Creates and manages S3 buckets with security best practices.

**Key Features:**
- Versioning support
- Server-side encryption
- Public access blocking
- Access logging
- Lifecycle configuration
- Bucket policies

**Usage:**
```hcl
module "data_bucket" {
  source = "./modules/aws-s3"
  
  bucket_name        = "my-data-bucket"
  enable_versioning  = true
  enable_encryption  = true
}
```

### 3. AWS RDS (`modules/aws-rds`)
Provisions RDS database instances with HA and backup options.

**Key Features:**
- Multi-engine support (MySQL, PostgreSQL, MariaDB, Oracle, SQL Server)
- Multi-AZ deployment
- Automated backups
- Performance Insights
- Storage encryption
- CloudWatch logging

**Usage:**
```hcl
module "database" {
  source = "./modules/aws-rds"
  
  instance_identifier = "my-database"
  engine             = "postgresql"
  engine_version     = "14.7"
  # ... additional configuration
}
```

### 4. AWS IAM (`modules/aws-iam`)
Manages IAM roles, users, and policies with fine-grained access control.

**Key Features:**
- IAM role creation
- Managed policy attachment
- Inline policy support
- Instance profile creation
- User management
- Policy attachment to users

**Usage:**
```hcl
module "app_role" {
  source = "./modules/aws-iam"
  
  role_name = "app-role"
  assume_role_policy = { /* policy */ }
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
}
```

### 5. AWS VPC (`modules/aws-vpc`)
Creates and configures VPC with public/private subnets and NAT gateways.

**Key Features:**
- Multi-AZ subnet deployment
- Internet Gateway setup
- NAT Gateway for private subnet internet access
- Route table management
- DNS configuration
- Auto-assign public IP

**Usage:**
```hcl
module "vpc" {
  source = "./modules/aws-vpc"
  
  vpc_name           = "main"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]
}
```

### 6. AWS Application Load Balancer (`modules/aws-alb`)
Provisions Application Load Balancer with target groups and listeners.

**Key Features:**
- ALB creation
- Target group management
- Health check configuration
- Listener setup
- SSL/TLS support
- Cross-zone load balancing

**Usage:**
```hcl
module "alb" {
  source = "./modules/aws-alb"
  
  alb_name        = "my-alb"
  security_groups = [aws_security_group.alb.id]
  subnets         = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  vpc_id          = aws_vpc.main.id
}
```

## Project Structure

```
.
├── main.tf                    # Root Terraform configuration
├── variables.tf               # Root variables
├── outputs.tf                 # Root outputs
├── terraform.tfvars          # Variable values (not in git)
├── .gitignore                # Git ignore patterns
├── .terraform.lock.hcl       # Terraform lock file
├── modules/
│   ├── aws-ec2/
│   ├── aws-s3/
│   ├── aws-rds/
│   ├── aws-iam/
│   ├── aws-vpc/
│   └── aws-alb/
└── README.md                 # This file
```

## Getting Started

### Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

### Installation

1. Clone the repository
2. Initialize Terraform:
```bash
terraform init
```

3. Create a `terraform.tfvars` file with your variables:
```hcl
aws_region   = "us-east-1"
project_name = "my-project"
environment  = "dev"
```

### Usage

Run Terraform commands in the root directory:

```bash
# Format and validate
terraform fmt -recursive
terraform validate

# Plan changes
terraform plan -var-file="terraform.tfvars"

# Apply changes
terraform apply -var-file="terraform.tfvars"

# Destroy resources
terraform destroy -var-file="terraform.tfvars"
```

## Module Variables

Each module has its own `variables.tf` file. Common patterns include:

- **Required variables**: Must be provided by the user
- **Optional variables**: Have default values
- **Sensitive variables**: Marked as sensitive (e.g., passwords)
- **Validation rules**: Enforce constraints on input values
- **Common tags**: Applied to all module resources

## Best Practices

1. **Always use variables** for configurable values
2. **Apply common tags** for resource organization and billing
3. **Enable encryption** for data at rest
4. **Use security groups** to restrict access
5. **Enable backups** for databases
6. **Document module usage** with examples
7. **Test modules** before applying to production
8. **Use remote state** for team collaboration
9. **Plan before apply** to review changes
10. **Keep sensitive data** in locked files

## Remote State

For production use, configure remote state:

```hcl
# backend.tf
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "aws-infrastructure/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

## Contributing

When adding new modules:

1. Create a new directory under `modules/`
2. Include `main.tf`, `variables.tf`, and `outputs.tf`
3. Add a comprehensive `README.md` with usage examples
4. Test the module with sample configurations
5. Document all inputs and outputs

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues or questions, please create an issue in the repository or contact the infrastructure team.
