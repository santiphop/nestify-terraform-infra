# General
region          = "ap-southeast-7"
project_name    = "nestify"
environment     = "dev"

# VPC
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["ap-southeast-7a", "ap-southeast-7b", "ap-southeast-7c"]


# ECS
ecs_ami_id         = "ami-014213dec21c9ded1"   
ecs_instance_type = "t3.nano"
ecs_cluster_name = "nestify-ecs-cluster"


# MongoDB EC2
# mongodb_instance_type = "t3.nano"
# mongodb_ami_id        = "ami-0075013580f6322a1"

ssh_key_name    = "nestify-ap-southeast-7"

# S3
s3_bucket_name  = "nestify-bucket"

# ECR
ecr_repository_name = "nestify-ecr"

# Elasticache
cluster_id = "nestify-redis"

