output "peering_connection_id" {
  description = "The peering connection ID"
  value       = aws_vpc_peering_connection.peering.id
}

output "peering_connection_status" {
  description = "The status of the peering connection"
  value       = aws_vpc_peering_connection.peering.accept_status
}
