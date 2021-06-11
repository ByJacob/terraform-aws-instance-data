## ElasticCache

variable "elasticache_raw_url" {
  default = "https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/elasticache/USD/current/elasticache-outposts.json"
  description = "URL provide file elasticache-outposts.json"
}

data "http" "elasticache_outposts" {
  url = var.elasticache_raw_url

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  elasticache_outposts_json = jsondecode(data.http.elasticache_outposts.body)
  elasticache_region        = local.elasticache_outposts_json.regions[local.aws_region_name]
  elasticache_instance_types_1 = flatten([
    for key, value in local.elasticache_region : [
      {
        instance_type       = value["Instance Type"]
        memory_gb           = replace(value["Memory"], " GiB", "")
        vcpu                = value["vCPU"]
        network_performance = value["Network Performance"]
        is_memcached        = length(regexall(".*Memcached.*", key)) > 0 ? true : false
        is_redis            = length(regexall(".*Redis.*", key)) > 0 ? true : false
      }
    ]
  ])
  elasticache_instance_types_2 = [for x in local.elasticache_instance_types_1 : x if x.is_memcached]
  data_elasticache_instance_type = {
    for x in local.elasticache_instance_types_2 : x.instance_type => {
      memory_gb           = x.memory_gb
      vcpu                = x.vcpu
      network_performance = x.network_performance
    }
  }
}

output "elasticache_instance_type_params" {
  value = local.data_elasticache_instance_type
  description = "Contains all ElasticCache instances"
}
