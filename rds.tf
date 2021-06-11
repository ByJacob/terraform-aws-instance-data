## RDS

variable "rds_raw_url" {
  default = "https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/rds/USD/current/rds-mysql-ondemand.json"
  description = "URL provide file rds-mysql-ondemand.json"
}

data "http" "rds_json" {
  url = var.rds_raw_url

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  rds_json   = jsondecode(data.http.rds_json.body)
  rds_region = local.rds_json.regions[local.aws_region_name]
  rds_instance_types_1 = tolist(toset(flatten([
    for key, value in local.rds_region : [
      value["Instance Type"]
    ]
  ])))
}

data "aws_ec2_instance_type" "rds" {
  count         = length(local.rds_instance_types_1)
  instance_type = replace(local.rds_instance_types_1[count.index], "db.", "")
}

locals {
  data_rds_instance_type = {
    for x in data.aws_ec2_instance_type.rds : "db.${x.instance_type}" => {
      memory_gb           = x.memory_size / 1024
      vcpu                = x.default_vcpus
      network_performance = x.network_performance
    }
  }
}

output "rds_instance_type_params" {
  value = local.data_rds_instance_type
  description = "Contains all RDS instances"
}
