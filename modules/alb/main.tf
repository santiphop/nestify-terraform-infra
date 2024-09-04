resource "aws_lb" "ecs_alb" {
  name               = "${var.project_name}-${var.environment}-ecs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-${var.environment}-ecs-alb"
  }
}

resource "aws_lb_target_group" "ecs_tg" {
  name        = "${var.project_name}-${var.environment}-ecs-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = var.health_check_path
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-ecs-tg"
  }
}

resource "aws_lb_listener" "ecs_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}
