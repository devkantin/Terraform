# AWS Lambda Module

Provisions Lambda functions with permissions, aliases, and VPC integration.

## Usage

```hcl
module "lambda_function" {
  source = "./modules/aws-lambda"

  filename      = "lambda_function.zip"
  function_name = "my-function"
  role_arn      = aws_iam_role.lambda.arn
  handler       = "index.handler"
  runtime       = "python3.11"
  
  timeout      = 300
  memory_size  = 512

  environment_variables = {
    BUCKET_NAME = aws_s3_bucket.bucket.id
  }

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `filename` - Path to Lambda code archive (required)
- `function_name` - Function name (required)
- `role_arn` - IAM role ARN (required)
- `handler` - Handler function (required)
- `runtime` - Runtime environment (required)
- `timeout` - Timeout in seconds (default: 60)
- `memory_size` - Memory in MB (default: 128)
- `environment_variables` - Environment variables

## Outputs

- `function_arn` - The function ARN
- `function_name` - The function name
- `function_invoke_arn` - The invoke ARN
- `function_version` - The function version
- `alias_arns` - Map of alias ARNs
