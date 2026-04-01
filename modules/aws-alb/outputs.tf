output "alb_id" {
  description = "The ID of the load balancer"
  value       = aws_lb.alb.id
}

output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the load balancer"
  value       = aws_lb.alb.zone_id
}

output "target_group_ids" {
  description = "Map of target group keys to their IDs"
  value       = { for k, tg in aws_lb_target_group.target_groups : k => tg.id }
}

output "target_group_arns" {
  description = "Map of target group keys to their ARNs"
  value       = { for k, tg in aws_lb_target_group.target_groups : k => tg.arn }
}

output "listener_ids" {
  description = "Map of listener keys to their IDs"
  value       = { for k, listener in aws_lb_listener.listeners : k => listener.id }
}
