resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "${var.project_name}-${var.environment}-ecs-template"
  image_id      = var.ecs_ami_id
  instance_type = var.ecs_instance_type

  key_name               = var.ssh_key_name
  vpc_security_group_ids = [var.security_group_id]
  
  iam_instance_profile {
    name = var.ecs_instance_profile_name
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 30
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-${var.environment}-ecs-instance"
    }
  }

  user_data = filebase64("${path.module}/ecs.sh")
}

resource "aws_autoscaling_group" "ecs_asg" {
  vpc_zone_identifier = var.public_subnet_ids
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1

  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}
