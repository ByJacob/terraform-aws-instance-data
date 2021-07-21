<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |
| <a name="provider_http"></a> [http](#provider\_http) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_instance_type.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [http_http.elasticsearch_outposts](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.rds_json](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_elasticsearch_raw_url"></a> [elasticsearch\_raw\_url](#input\_elasticsearch\_raw\_url) | URL provide file es-ondemand.json | `string` | `"https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/es/USD/current/es-ondemand.json"` | no |
| <a name="input_rds_raw_url"></a> [rds\_raw\_url](#input\_rds\_raw\_url) | URL provide file rds-mysql-ondemand.json | `string` | `"https://b0.p.awsstatic.com/pricing/2.0/meteredUnitMaps/rds/USD/current/rds-mysql-ondemand.json"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_instance_type_params"></a> [elasticache\_instance\_type\_params](#output\_elasticache\_instance\_type\_params) | Contains all ElasticCache instances |
| <a name="output_elasticsearch_instance_type_params"></a> [elasticsearch\_instance\_type\_params](#output\_elasticsearch\_instance\_type\_params) | Contains all ElasticSearch instances |
| <a name="output_rds_instance_type_params"></a> [rds\_instance\_type\_params](#output\_rds\_instance\_type\_params) | Contains all RDS instances |
<!-- markdownlint-restore -->
