variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the load balancer will be created"
  type        = string
}

variable "public_subnets" {
  description = "The public subnets for the load balancer"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The security groups for the load balancer"
  type        = list(string)
}

variable "health_check_path" {
  description = "The path for the health check"
  type        = string
  default     = "/health"
}
