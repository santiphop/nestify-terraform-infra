output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.ecs_alb.dns_name
}

output "alb_target_group_arn" {
  description = "The ARN of the ALB Target Group"
  value       = aws_lb_target_group.ecs_tg.arn
}
