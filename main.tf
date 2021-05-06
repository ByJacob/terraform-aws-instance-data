data "aws_region" "current" {}

locals {
  aws_region_name = replace(data.aws_region.current.description, "Europe", "EU")
}
