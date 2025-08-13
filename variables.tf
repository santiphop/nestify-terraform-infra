variable "region" {
  description = "The AWS region to create resources in"
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

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "Name for the ECS Cluster"
  type        = string
}

# variable "mongodb_instance_type" {
#   description = "Instance type for MongoDB EC2"
#   type        = string
# }

# variable "mongodb_ami_id" {
#   description = "AMI ID for MongoDB EC2"
#   type        = string
# }

variable "s3_bucket_name" {
  description = "Name for the S3 Bucket"
  type        = string
}

variable "ecr_repository_name" {
  description = "Name for the ECR Repository"
  type        = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

# variable "mongodb_uri" {
#   description = "The URI of the MongoDB instance"
#   type        = string
# }

variable "cluster_id" {
  description = "Cluster ID for the Elasticache instance"
  type        = string
}

variable "ecs_ami_id" {
  description = "The AMI ID for the ECS instance"
  type        = string
}

variable "ecs_instance_type" {
  description = "The instance type for ECS EC2 instances."
  type        = string
}