provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
  project_name   = var.project_name
  environment    = var.environment
}

module "nsg" {
  source = "./modules/nsg"
  vpc_id = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnets    = module.vpc.public_subnets
  security_group_ids = [module.nsg.alb_sg_id]
  health_check_path = "/health"
}

module "ecs" {
  source                        = "./modules/ecs"
  security_group_id             = module.nsg.ecs_sg_id
  public_subnet_ids             = module.vpc.public_subnets
  ecs_cluster_name              = var.ecs_cluster_name
  ecs_ami_id                    = var.ecs_ami_id
  ecs_instance_profile_name     = module.iam.ecs_instance_profile_name
  ssh_key_name                  = var.ssh_key_name
  project_name                  = var.project_name
  environment                   = var.environment

  depends_on = [module.iam]
}

module "mongodb_ec2" {
  source             = "./modules/mongodb_ec2"
  security_group_id  = module.nsg.mongodb_sg_id
  subnet_id          = module.vpc.public_subnets[0]
  instance_type      = var.mongodb_instance_type
  ami_id             = var.mongodb_ami_id
  key_name           = var.ssh_key_name
  project_name       = var.project_name
  environment        = var.environment
}

module "elasticache" {
  source             = "./modules/elasticache"
  vpc_id             = module.vpc.vpc_id
  security_group_id  = module.nsg.redis_sg_id
  subnet_ids         = module.vpc.private_subnets
  cluster_id         = var.cluster_id
  project_name       = var.project_name
  environment        = var.environment
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "${var.project_name}-${var.environment}-bucket-${local.random_suffix}"
}

module "iam" {
  source             = "./modules/iam"
  project_name       = var.project_name
  environment        = var.environment
}

module "ecr" {
  source = "./modules/ecr"
  repository_name = var.ecr_repository_name
}