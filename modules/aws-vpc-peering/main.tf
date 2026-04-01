resource "aws_vpc_peering_connection" "peering" {
  vpc_id            = var.vpc_id
  peer_vpc_id       = var.peer_vpc_id
  peer_owner_id     = var.peer_owner_id
  peer_region       = var.peer_region
  auto_accept       = var.auto_accept

  tags = merge(
    var.common_tags,
    {
      Name = var.peering_name
    }
  )
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  count                     = var.accepter_enabled ? 1 : 0
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  auto_accept               = var.accepter_auto_accept
}

resource "aws_vpc_peering_connection_options" "options" {
  count                     = var.configure_options ? 1 : 0
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id

  accepter {
    allow_remote_vpc_dns_resolution = var.accepter_allow_remote_vpc_dns_resolution
  }

  requester {
    allow_remote_vpc_dns_resolution = var.requester_allow_remote_vpc_dns_resolution
  }
}

resource "aws_route" "route_requester" {
  for_each                  = var.requester_routes
  route_table_id            = each.value.route_table_id
  destination_cidr_block    = each.value.destination_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}

resource "aws_route" "route_accepter" {
  for_each                  = var.accepter_routes
  route_table_id            = each.value.route_table_id
  destination_cidr_block    = each.value.destination_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}
