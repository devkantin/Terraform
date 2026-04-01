# AWS Infrastructure Terraform Modules

A comprehensive collection of 26 reusable Terraform modules for provisioning AWS infrastructure components. All modules follow best practices for security, scalability, and maintainability.

## 📋 Complete Module Catalog

### **Compute** (5 modules)
- **aws-ec2** - EC2 instances with auto-scaling and monitoring
- **aws-lambda** - Serverless functions with versioning and aliases
- **aws-ecs** - Container orchestration with Fargate support
- **aws-ecr** - Container image registry with lifecycle policies
- **aws-autoscaling** - Auto-scaling groups with dynamic policies

### **Storage & Databases** (6 modules)
- **aws-s3** - S3 buckets with encryption and lifecycle management
- **aws-ebs** - Elastic block storage with snapshots
- **aws-rds** - RDS database instances (MySQL, PostgreSQL, Oracle, etc.)
- **aws-dynamodb** - NoSQL database with streams and TTL
- **aws-documentdb** - MongoDB-compatible database clusters
- **aws-elasticache** - Redis/Memcached caching clusters

### **Networking** (5 modules)
- **aws-vpc** - VPC with public/private subnets and NAT gateways
- **aws-security-group** - Network security rules and ACLs
- **aws-alb** - Application Load Balancer with target groups
- **aws-vpc-peering** - VPC peering with route configuration
- **aws-vpn** - Site-to-site VPN connectivity

### **Messaging & Events** (2 modules)
- **aws-sqs** - Message queue service (FIFO and standard)
- **aws-sns** - Notification service with subscriptions

### **Networking & DNS** (1 module)
- **aws-route53** - DNS management with health checks and routing policies

### **Security & Encryption** (3 modules)
- **aws-iam** - IAM roles, users, and permission policies
- **aws-kms** - Key management service with multi-region support
- **aws-secrets-manager** - Secrets storage and rotation

### **Monitoring & Logging** (2 modules)
- **aws-cloudwatch** - Logs, metrics, alarms, and dashboards
- **aws-cloudtrail** - Audit logging for AWS API calls

### **Configuration & Deployment** (2 modules)
- **aws-ssm-parameter-store** - Configuration management and secrets
- **aws-codedeploy** - Application deployment automation

## 🗂️ Module Quick Reference

| Module | Purpose | Type |
|--------|---------|------|
| aws-alb | Load balancing | Networking |
| aws-autoscaling | EC2 scaling | Compute |
| aws-cloudtrail | Audit logging | Logging |
| aws-cloudwatch | Monitoring | Monitoring |
| aws-codedeploy | Deployments | CI/CD |
| aws-documentdb | MongoDB DB | Database |
| aws-dynamodb | NoSQL DB | Database |
| aws-ebs | Block storage | Storage |
| aws-ec2 | Virtual machines | Compute |
| aws-ecr | Container registry | Container |
| aws-ecs | Container orchestration | Container |
| aws-elasticache | Caching | Database |
| aws-iam | Access control | Security |
| aws-kms | Key management | Security |
| aws-lambda | Serverless compute | Compute |
| aws-rds | Relational DB | Database |
| aws-route53 | DNS | Networking |
| aws-s3 | Object storage | Storage |
| aws-secrets-manager | Secret storage | Security |
| aws-security-group | Network security | Networking |
| aws-sns | Notifications | Messaging |
| aws-sqs | Message queues | Messaging |
| aws-ssm-parameter-store | Configuration | Config |
| aws-vpc | Virtual network | Networking |
| aws-vpc-peering | VPC connectivity | Networking |
| aws-vpn | Site-to-site VPN | Networking |

## 📚 Usage Examples

### Example 1: Basic EC2 Instance
```hcl
module "web_server" {
  source = "./modules/aws-ec2"
  
  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.small"
  instance_name = "web-server-1"
  subnet_id     = aws_subnet.main.id
  security_group_ids = [aws_security_group.web.id]
}
```

### Example 2: Complete VPC Setup
```hcl
module "vpc" {
  source = "./modules/aws-vpc"
  
  vpc_name           = "main"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.10.0/24", "10.0.11.0/24"]
}
```

### Example 3: Application Load Balancer
```hcl
module "alb" {
  source = "./modules/aws-alb"
  
  alb_name        = "api-lb"
  security_groups = [aws_security_group.alb.id]
  subnets         = module.vpc.public_subnet_ids
  vpc_id          = module.vpc.vpc_id
  
  target_groups = {
    api = {
      name     = "api-tg"
      port     = 80
      protocol = "HTTP"
    }
  }
}
```

### Example 4: RDS Database
```hcl
module "database" {
  source = "./modules/aws-rds"
  
  instance_identifier = "prod-db"
  engine             = "postgresql"
  engine_version     = "14.7"
  instance_class     = "db.t3.micro"
  database_username  = "admin"
  database_password  = var.db_password
  multi_az           = true
}
```

### Example 5: Lambda Function
```hcl
module "api_function" {
  source = "./modules/aws-lambda"
  
  filename      = "lambda_function.zip"
  function_name = "api-handler"
  role_arn      = aws_iam_role.lambda.arn
  handler       = "index.handler"
  runtime       = "python3.11"
  timeout       = 60
  memory_size   = 512
}
```

## Project Structure

```
.
├── main.tf                           # Root Terraform configuration
├── variables.tf                      # Root variables
├── outputs.tf                        # Root outputs
├── terraform.tfvars.example         # Example variables file
├── .gitignore                        # Git ignore patterns
├── README.md                         # This file
├── modules/
│   ├── aws-alb/                     # Application Load Balancer
│   ├── aws-autoscaling/             # EC2 Auto Scaling Groups
│   ├── aws-cloudtrail/              # Audit Logging
│   ├── aws-cloudwatch/              # Monitoring & Logs
│   ├── aws-codedeploy/              # Application Deployment
│   ├── aws-documentdb/              # MongoDB-compatible DB
│   ├── aws-dynamodb/                # NoSQL Database
│   ├── aws-ebs/                     # Block Storage
│   ├── aws-ec2/                     # Virtual Machines
│   ├── aws-ecr/                     # Container Registry
│   ├── aws-ecs/                     # Container Orchestration
│   ├── aws-elasticache/             # Redis/Memcached
│   ├── aws-iam/                     # Identity & Access
│   ├── aws-kms/                     # Key Management
│   ├── aws-lambda/                  # Serverless Functions
│   ├── aws-rds/                     # Relational Database
│   ├── aws-route53/                 # DNS Management
│   ├── aws-s3/                      # Object Storage
│   ├── aws-secrets-manager/         # Secrets Storage
│   ├── aws-security-group/          # Network Security
│   ├── aws-sns/                     # Notifications
│   ├── aws-sqs/                     # Message Queues
│   ├── aws-ssm-parameter-store/     # Configuration Store
│   ├── aws-vpc/                     # Virtual Network
│   ├── aws-vpc-peering/             # VPC Peering
│   └── aws-vpn/                     # Site-to-Site VPN
└── .terraform.lock.hcl              # Terraform lock file
```

## 🚀 Getting Started

### Prerequisites

- **Terraform** >= 1.0
- **AWS CLI** configured with appropriate credentials
- **AWS Account** with necessary permissions for services being deployed

### Quick Setup

1. **Clone the repository**
```bash
git clone https://github.com/devkantin/Terraform.git
cd Terraform
```

2. **Initialize Terraform**
```bash
terraform init
```

3. **Create terraform.tfvars with your configuration**
```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

4. **Review and apply changes**
```bash
# Validate configuration
terraform validate

# Format code
terraform fmt -recursive

# Plan changes
terraform plan -var-file="terraform.tfvars"

# Apply changes
terraform apply -var-file="terraform.tfvars"
```

### Common Operations

```bash
# Validate all modules
terraform validate

# Format all Terraform files
terraform fmt -recursive

# Plan infrastructure changes
terraform plan -var-file="terraform.tfvars"

# Apply infrastructure changes
terraform apply -var-file="terraform.tfvars"

# Destroy all resources
terraform destroy -var-file="terraform.tfvars"

# Get specific module outputs
terraform output -json | jq '.module_name'
```

## 📖 Module Documentation

Each module directory contains:

- **main.tf** - Core resource definitions
- **variables.tf** - Input variables with validation rules
- **outputs.tf** - Output values for integration with other modules
- **README.md** - Comprehensive usage documentation and examples

### Module Variables

All modules support configurable inputs. Common patterns include:

- **Required variables**: Must be explicitly provided (e.g., `instance_id`, `bucket_name`)
- **Optional variables**: Have sensible defaults (e.g., `retention_days = 7`)
- **Sensitive variables**: Marked as sensitive to protect secrets (passwords, keys)
- **Validation rules**: Enforce valid input values and constraints
- **Common tags**: Applied consistently across all resources for organization

Example variable structure:
```hcl
variable "name" {
  description = "Resource name"
  type        = string
  nullable    = false  # Required
}

variable "retention_days" {
  description = "Retention period"
  type        = number
  default     = 7      # Optional with default
}

variable "password" {
  description = "Database password"
  type        = string
  sensitive   = true   # Sensitive data
}
```

## ✅ Best Practices

### Security
1. **Enable encryption** for all data at rest (EBS, S3, RDS, DynamoDB)
2. **Use security groups** to restrict network access
3. **Enable backups** and point-in-time recovery for databases
4. **Rotate secrets** regularly using Secrets Manager
5. **Enable MFA** for AWS account access
6. **Use IAM roles** instead of access keys for applications
7. **Enable CloudTrail** for audit logging
8. **Encrypt sensitive variables** in terraform.tfvars

### Operations
1. **Always use variables** for configurable values
2. **Apply common tags** for resource management and billing
3. **Use workspaces** for managing multiple environments (dev, staging, prod)
4. **Test modules** before applying to production
5. **Plan before apply** to review what changes will be made
6. **Enable versioning** for backends and important resources
7. **Document assumptions** and dependencies between modules

### Infrastructure as Code
1. **Use consistent naming** conventions across all resources
2. **Keep modules focused** - one responsibility per module
3. **Version your modules** for reproducible deployments
4. **Use git branches** for feature development
5. **Implement code reviews** before merging changes
6. **Automate testing** of Terraform configurations
7. **Keep sensitive data out of git** - use `.gitignore` and Secrets Manager

## 🔧 Configuration Examples

### Development Environment
```hcl
aws_region   = "us-east-1"
project_name = "my-project"
environment  = "dev"
```

### Production Environment
```hcl
aws_region   = "us-east-1"
project_name = "my-project"
environment  = "production"
```

### Multi-Environment Setup
```bash
# Use separate tfvars files per environment
terraform plan -var-file="environments/dev.tfvars"
terraform plan -var-file="environments/prod.tfvars"

# Or use workspaces
terraform workspace new dev
terraform workspace new prod
terraform workspace select dev
```

## 🗄️ Remote State Management

For production use, configure remote state to enable team collaboration and avoid conflicts:

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

### S3 Backend Setup
```bash
# Create S3 bucket
aws s3 mb s3://my-terraform-state --region us-east-1
aws s3api put-bucket-versioning \
  --bucket my-terraform-state \
  --versioning-configuration Status=Enabled

# Create DynamoDB table for locking
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

## 🤝 Contributing

Contributions are welcome! When adding new modules or features:

### Module Development Guidelines

1. **Create module structure**
   - New directory under `modules/`
   - Include `main.tf`, `variables.tf`, `outputs.tf`, and `README.md`

2. **Follow naming conventions**
   - Snake_case for variables and outputs
   - PascalCase for local values where needed
   - Consistent resource names within modules

3. **Add comprehensive documentation**
   - Usage examples in README.md
   - Input variable descriptions
   - Output value descriptions
   - Example configurations

4. **Implement best practices**
   - Enable encryption by default
   - Include tagging support
   - Define sensible defaults
   - Add validation rules where appropriate

5. **Test thoroughly**
   - Validate module syntax: `terraform validate`
   - Test with example configurations
   - Ensure outputs are correct
   - Document any prerequisites

### Pull Request Process

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-module`
3. Commit changes: `git commit -am 'Add new module'`
4. Push to branch: `git push origin feature/new-module`
5. Submit a pull request with clear description

## 📊 Module Statistics

- **Total Modules**: 26
- **Total Resources**: 100+
- **Lines of Code**: 5,452+
- **Configuration Files**: 110+

## 🔗 Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Terraform Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/cloud-docs/guides/recommended-practices)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 💬 Support

For issues, questions, or suggestions:

1. **Check existing documentation** in module README files
2. **Create an issue** on GitHub with detailed description
3. **Include error messages** and configuration examples
4. **Contact the infrastructure team** for additional help

---

**Last Updated**: April 2026  
**Terraform Version**: >= 1.0  
**AWS Provider Version**: ~> 5.0
