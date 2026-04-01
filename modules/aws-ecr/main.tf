resource "aws_ecr_repository" "repository" {
  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.repository_name
    }
  )
}

resource "aws_ecr_repository_policy" "policy" {
  count          = var.repository_policy != null ? 1 : 0
  repository     = aws_ecr_repository.repository.name
  policy         = jsonencode(var.repository_policy)
}

resource "aws_ecr_lifecycle_policy" "policy" {
  count          = var.lifecycle_policy != null ? 1 : 0
  repository     = aws_ecr_repository.repository.name
  policy         = jsonencode(var.lifecycle_policy)
}
