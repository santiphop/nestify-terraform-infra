output "api_gateway_sg_id" {
  value = aws_security_group.api_gateway_sg.id
}

output "lambda_sg_id" {
  value = aws_security_group.lambda_sg.id
}

output "elb_sg_id" {
  value = aws_security_group.elb_sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}

output "mongodb_sg_id" {
  value = aws_security_group.mongodb_sg.id
}

output "redis_sg_id" {
  value = aws_security_group.redis_sg.id
}

output "alb_sg_id" {
  description = "The ID of the ALB security group"
  value       = aws_security_group.alb_sg.id
}