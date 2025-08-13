output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

# output "mongodb_endpoint" {
#   value       = module.mongodb_ec2.mongodb_endpoint
# }

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "elasticache_endpoint" {
  value = module.elasticache.endpoint
}

output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}
