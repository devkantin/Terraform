output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.instance.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.instance.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the instance"
  value       = aws_instance.instance.private_ip
}

output "instance_arn" {
  description = "The ARN of the instance"
  value       = aws_instance.instance.arn
}

output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = aws_instance.instance.primary_network_interface_id
}
