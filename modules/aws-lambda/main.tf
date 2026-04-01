resource "aws_lambda_function" "function" {
  filename      = var.filename
  function_name = var.function_name
  role          = var.role_arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size

  source_code_hash = var.source_code_hash

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = var.environment_variables
  }

  layers = var.lambda_layers

  tags = merge(
    var.common_tags,
    {
      Name = var.function_name
    }
  )

  depends_on = var.depends_on
}

resource "aws_lambda_permission" "permissions" {
  for_each = var.lambda_permissions

  statement_id  = each.value.statement_id
  action        = each.value.action
  function_name = aws_lambda_function.function.function_name
  principal     = each.value.principal
  source_arn    = each.value.source_arn
}

resource "aws_lambda_alias" "aliases" {
  for_each = var.lambda_aliases

  name            = each.key
  description     = each.value.description
  lambda_function_version = aws_lambda_function.function.version
  function_name   = aws_lambda_function.function.function_name

  routing_config {
    additional_version_weight_map = each.value.routing_config
  }
}
