resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = jsonencode(var.assume_role_policy)

  tags = merge(
    var.common_tags,
    {
      Name = var.role_name
    }
  )
}

resource "aws_iam_role_policy_attachment" "managed_policies" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.role.name
  policy_arn = each.value
}

resource "aws_iam_role_policy" "inline_policies" {
  for_each = var.inline_policies

  name   = each.key
  role   = aws_iam_role.role.id
  policy = jsonencode(each.value)
}

resource "aws_iam_instance_profile" "profile" {
  count = var.create_instance_profile ? 1 : 0
  name  = "${var.role_name}-profile"
  role  = aws_iam_role.role.name
}

resource "aws_iam_user" "user" {
  for_each = toset(var.create_users ? var.user_names : [])

  name = each.value

  tags = merge(
    var.common_tags,
    {
      Name = each.value
    }
  )
}

resource "aws_iam_user_policy_attachment" "user_managed_policies" {
  for_each = {
    for entry in flatten([
      for user in aws_iam_user.user : [
        for arn in var.user_managed_policy_arns : {
          user = user.name
          arn  = arn
        }
      ]
    ]) : "${entry.user}:${entry.arn}" => entry
  }

  user       = each.value.user
  policy_arn = each.value.arn
}
