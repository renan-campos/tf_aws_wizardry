data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "region-name"
    values = [data.aws_region.current.name]
  }
}
