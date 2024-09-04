variable "ecs_ami_id" {
  description = "The AMI ID for the ECS instance"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name for the ECS Cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ECS instances"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for ECS instances"
  type        = string
}

variable "ecs_instance_profile_name" {
  description = "The IAM instance profile name for ECS instances"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment name"
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "ecs_instance_type" {
  description = "Instance type for the ECS EC2 instances."
  type        = string
  default     = "t3.micro"  // You can set a default or leave it without a default to ensure it's specified explicitly.
}


# variable "ecs_task_execution_role_arn" {
#   description = "The ARN of the ECS task execution role"
#   type        = string
# }

# variable "alb_target_group_arn" {
#   description = "The ARN of the ALB target group"
#   type        = string
# }