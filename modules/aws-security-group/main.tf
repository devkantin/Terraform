resource "aws_security_group" "security_group" {
  name_prefix = var.name_prefix
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = var.name_prefix
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule }

  security_group_id = aws_security_group.security_group.id

  cidr_ipv4                 = each.value.cidr_blocks != null ? each.value.cidr_blocks[0] : null
  ipv6_cidr_block           = each.value.ipv6_cidr_blocks != null ? each.value.ipv6_cidr_blocks[0] : null
  referenced_security_group_id = each.value.security_group_id
  from_port                 = each.value.from_port
  to_port                   = each.value.to_port
  ip_protocol               = each.value.protocol
  description               = each.value.description
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  security_group_id = aws_security_group.security_group.id

  cidr_ipv4                 = each.value.cidr_blocks != null ? each.value.cidr_blocks[0] : null
  ipv6_cidr_block           = each.value.ipv6_cidr_blocks != null ? each.value.ipv6_cidr_blocks[0] : null
  referenced_security_group_id = each.value.security_group_id
  from_port                 = each.value.from_port
  to_port                   = each.value.to_port
  ip_protocol               = each.value.protocol
  description               = each.value.description
}
