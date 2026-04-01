resource "aws_ssm_parameter" "parameter" {
  for_each = var.parameters

  name            = each.value.name
  type            = each.value.type
  value           = each.value.value
  description     = each.value.description
  tier            = each.value.tier
  key_id          = each.value.key_id

  tags = merge(
    var.common_tags,
    {
      Name = each.value.name
    }
  )
}
