provider "aws" {
  region = var.aws_region
}

module "list-subnets" {
  source     = "../../list-subnets"
  aws_region = var.aws_region
  infra_id   = var.infra_id
}

