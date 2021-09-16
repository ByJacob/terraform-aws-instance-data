output "elasticache_instance_type_params" {
  value = local.data_elasticache_instance_type
  description = "Contains all ElasticCache instances"
}

output "search_instance_type_params" {
  value = local.data_search_instance_type
  description = "Contains all OpenSearch instances"
}

output "rds_instance_type_params" {
  value = local.data_rds_instance_type
  description = "Contains all RDS instances"
}