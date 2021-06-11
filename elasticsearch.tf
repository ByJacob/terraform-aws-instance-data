## ElasticCache

variable "elasticsearch_raw_url" {
  default = "https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/es/USD/current/es-ondemand.json"
  description = "URL provide file es-ondemand.json "
}

data "http" "elasticsearch_outposts" {
  url = var.elasticsearch_raw_url

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  elasticsearch_outposts_json = jsondecode(data.http.elasticsearch_outposts.body)
  elasticsearch_region        = local.elasticsearch_outposts_json.regions[local.aws_region_name]
  elasticsearch_instance_types_1 = flatten([
    for key, value in local.elasticsearch_region : [
      {
        instance_type       = lookup(value, "Instance Type", "UNKNOWN")
        memory_gb           = lookup(value, "Memory (GiB)", "UNKNOWN")
        vcpu                = lookup(value, "vCPU", "UNKNOWN")
        network_performance = ""
        is_elasticsearch    = lookup(value, "Instance Type", "UNKNOWN") == "UNKNOWN" ? false : true
      }
    ]
  ])
  elasticsearch_instance_types_2 = [for x in local.elasticsearch_instance_types_1 : x if x.is_elasticsearch]
  data_elasticsearch_instance_type = {
    for x in local.elasticsearch_instance_types_2 : x.instance_type => {
      memory_gb           = x.memory_gb
      vcpu                = x.vcpu
      network_performance = x.network_performance
    }
  }
}

output "elasticsearch_instance_type_params" {
  value = local.data_elasticsearch_instance_type
  description = "Contains all ElasticSearch instances"
}
