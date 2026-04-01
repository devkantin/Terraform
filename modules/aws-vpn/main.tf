resource "aws_customer_gateway" "gateway" {
  bgp_asn    = var.bgp_asn
  public_ip  = var.public_ip
  type       = var.type
  ip_address = var.ip_address

  tags = merge(
    var.common_tags,
    {
      Name = var.gateway_name
    }
  )
}

resource "aws_vpn_gateway" "gateway" {
  vpc_id            = var.vpc_id
  amazon_side_asn   = var.amazon_side_asn
  availability_zone = var.availability_zone

  tags = merge(
    var.common_tags,
    {
      Name = var.vpn_gateway_name
    }
  )
}

resource "aws_vpn_connection" "connection" {
  type                = "ipsec.1"
  customer_gateway_id = aws_customer_gateway.gateway.id
  vpn_gateway_id      = aws_vpn_gateway.gateway.id
  static_routes_only  = var.static_routes_only

  tags = merge(
    var.common_tags,
    {
      Name = var.connection_name
    }
  )
}

resource "aws_vpn_connection_route" "routes" {
  for_each = var.vpn_routes

  destination_cidr_block = each.value
  vpn_connection_id      = aws_vpn_connection.connection.id
}

resource "aws_vpn_gateway_route_propagation" "propagation" {
  count          = length(var.route_table_ids) > 0 ? 1 : 0
  vpn_gateway_id = aws_vpn_gateway.gateway.id
  route_table_id = var.route_table_ids[0]
}
