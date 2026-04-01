# AWS ECR Module

Provisions ECR repositories for storing Docker container images.

## Usage

```hcl
module "ecr" {
  source = "./modules/aws-ecr"

  repository_name      = "my-app"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true

  lifecycle_policy = {
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus     = "any"
          countType     = "imageCountMoreThan"
          countNumber   = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `repository_name` - Repository name (required)
- `image_tag_mutability` - MUTABLE or IMMUTABLE (default: MUTABLE)
- `scan_on_push` - Enable image scanning (default: true)
- `encryption_type` - AES256 or KMS (default: AES256)
- `lifecycle_policy` - Lifecycle policy

## Outputs

- `repository_url` - The repository URL
- `repository_arn` - The repository ARN
- `registry_id` - The registry ID
