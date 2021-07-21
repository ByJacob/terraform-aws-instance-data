## ElasticCache

locals {
  data_elasticache_instance_type = {
    "cache.t2.micro" = {
      "vcpu" = 1,
      "memory_gb" = 0.555,
    },
    "cache.t2.small" = {
      "vcpu" = 1,
      "memory_gb" = 1.55,
    },
    "cache.t2.medium" = {
      "vcpu" = 2,
      "memory_gb" = 3.22,
    },
    "cache.t3.micro" = {
      "vcpu" = 2,
      "memory_gb" = 0.5,
    },
    "cache.t3.small" = {
      "vcpu" = 2,
      "memory_gb" = 1.37,
    },
    "cache.t3.medium" = {
      "vcpu" = 2,
      "memory_gb" = 3.09,
    },
    "cache.m4.large" = {
      "vcpu" = 2,
      "memory_gb" = 6.42,
    },
    "cache.m4.xlarge" = {
      "vcpu" = 4,
      "memory_gb" = 14.28,
    },
    "cache.m4.2xlarge" = {
      "vcpu" = 8,
      "memory_gb" = 29.70,
    },
    "cache.m4.4xlarge" = {
      "vcpu" = 16,
      "memory_gb" = 60.78,
    },
    "cache.m4.10xlarge" = {
      "vcpu" = 40,
      "memory_gb" = 154.64,
    },
    "cache.m5.large" = {
      "vcpu" = 2,
      "memory_gb" = 6.38,
    },
    "cache.m5.xlarge" = {
      "vcpu" = 4,
      "memory_gb" = 12.93,
    },
    "cache.m5.2xlarge" = {
      "vcpu" = 8,
      "memory_gb" = 26.04,
    },
    "cache.m5.4xlarge" = {
      "vcpu" = 16,
      "memory_gb" = 52.26,
    },
    "cache.m5.12xlarge" = {
      "vcpu" = 48,
      "memory_gb" = 157.12,
    },
    "cache.m5.24xlarge" = {
      "vcpu" = 96,
      "memory_gb" = 314.32,
    },
    "cache.m6g.large" = {
      "vcpu" = 2,
      "memory_gb" = 6.38,
    },
    "cache.m6g.xlarge" = {
      "vcpu" = 4,
      "memory_gb" = 12.94,
    },
    "cache.m6g.2xlarge" = {
      "vcpu" = 8,
      "memory_gb" = 26.05,
    },
    "cache.m6g.4xlarge" = {
      "vcpu" = 16,
      "memory_gb" = 52.26,
    },
    "cache.m6g.8xlarge" = {
      "vcpu" = 32,
      "memory_gb" = 103.68,
    },
    "cache.m6g.12xlarge" = {
      "vcpu" = 48,
      "memory_gb" = 157.13,
    },
    "cache.m6g.16xlarge" = {
      "vcpu" = 64,
      "memory_gb" = 209.55,
    },
    "cache.r4.large" = {
      "vcpu" = 2,
      "memory_gb" = 12.3,
    },
    "cache.r4.xlarge" = {
      "vcpu" = 4,
      "memory_gb" = 25.05,
    },
    "cache.r4.2xlarge" = {
      "vcpu" = 8,
      "memory_gb" = 50.47,
    },
    "cache.r4.4xlarge" = {
      "vcpu" = 16,
      "memory_gb" = 101.38,
    },
    "cache.r4.8xlarge" = {
      "vcpu" = 32,
      "memory_gb" = 203.26,
    },
    "cache.r4.16xlarge" = {
      "vcpu" = 64,
      "memory_gb" = 407,
    },
    "cache.r5.large" = {
      "vcpu" = 2,
      "memory_gb" = 13.07,
    },
    "cache.r5.xlarge" = {
      "vcpu" = 4,
      "memory_gb" = 26.32,
    },
    "cache.r5.2xlarge" = {
      "vcpu" = 8,
      "memory_gb" = 52.82,
    },
    "cache.r5.4xlarge" = {
      "vcpu" = 16,
      "memory_gb" = 105.81,
    },
    "cache.r5.12xlarge" = {
      "vcpu" = 48,
      "memory_gb" = 317.77,
    },
    "cache.r5.24xlarge" = {
      "vcpu" = 96,
      "memory_gb" = 635.61,
    },
    "cache.r6g.large" = {
      "vcpu" = 2,
      "memory_gb" = 13.07,
    },
    "cache.r6g.xlarge" = {
      "vcpu" = 4,
      "memory_gb" = 26.32,
    },
    "cache.r6g.2xlarge" = {
      "vcpu" = 8,
      "memory_gb" = 52.82,
    },
    "cache.r6g.4xlarge" = {
      "vcpu" = 16,
      "memory_gb" = 105.81,
    },
    "cache.r6g.8xlarge" = {
      "vcpu" = 32,
      "memory_gb" = 209.55,
    },
    "cache.r6g.12xlarge" = {
      "vcpu" = 48,
      "memory_gb" = 317.77,
    },
    "cache.r6g.16xlarge" = {
      "vcpu" = 64,
      "memory_gb" = 419.10,
    }
  }
}

output "elasticache_instance_type_params" {
  value = local.data_elasticache_instance_type
  description = "Contains all ElasticCache instances"
}
