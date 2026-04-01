output "customer_gateway_id" {
  description = "The customer gateway ID"
  value       = aws_customer_gateway.gateway.id
}

output "vpn_gateway_id" {
  description = "The VPN gateway ID"
  value       = aws_vpn_gateway.gateway.id
}

output "vpn_connection_id" {
  description = "The VPN connection ID"
  value       = aws_vpn_connection.connection.id
}

output "vpn_connection_tunnel1_address" {
  description = "Tunnel 1 address"
  value       = aws_vpn_connection.connection.tunnel1_address
}

output "vpn_connection_tunnel2_address" {
  description = "Tunnel 2 address"
  value       = aws_vpn_connection.connection.tunnel2_address
}
