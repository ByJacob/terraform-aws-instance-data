# terraform-aws-instance-data

Terraform module providing data on RDS, ES and ElasticCache instances. This module provide: vCPU, memory and network_performance

## Usage

```hcl
module "cdn" {
  source = "git::https://example.com/terraform-aws-instance-data"
  # I highly recommend that in your code you pin the version exactly to the version you are using to keep your infrastructure stable and update the versions systematically so that they do not surprise you.
  # source = "git::https://example.com/terraform-aws-instance-data?ref=GIT_TAG"
}
```

## Requirements

| Name           | Version   |
| -------------- | --------- |
| terraform      | >= 0.13.0 |
| hashicorp/aws  | >= 2.0    |
| hashicorp/http | >= 2.0    |

## Providers

| Name           | Version |
| -------------- | ------- |
| hashicorp/aws  | >= 2.0  |
| hashicorp/http | >= 2.0  |

## Inputs

By default, the module requires no input. The following variables are only for retrieving the instance types. I set them as variables so that in the absence of updates you could change the URL yourself.

| Name                  | Description                                | Type   | Default                 |
| --------------------- | ------------------------------------------ | ------ | ----------------------- |
| elasticache_raw_url   | URL provide file elasticache-outposts.json | String | Check `elasticcache.tf` |
| elasticsearch_raw_url | URL provide file es-ondemand.json          | String | Check `elasticcache.tf` |
| rds_raw_url           | URL provide file rds-mysql-ondemand.json   | String | Check `rds.tf`          |

## Outputs

| Name                               | Description                          |
| ---------------------------------- | ------------------------------------ |
| elasticache_instance_type_params   | Contains all ElasticCache instances  |
| elasticsearch_instance_type_params | Contains all ElasticSearch instances |
| rds_instance_type_params           | Contains all RDS instances           |
