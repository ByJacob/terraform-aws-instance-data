locals {
  data_elasticache_instance_type = jsondecode(file("${path.module}/data/data_elasticache.json"))
  data_search_instance_type = jsondecode(file("${path.module}/data/data_search.json"))
  data_rds_instance_type = jsondecode(file("${path.module}/data/data_rds.json"))
}
