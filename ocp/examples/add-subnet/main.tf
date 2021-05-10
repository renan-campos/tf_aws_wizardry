provider "aws" {
  region = var.aws_region
}

module "add-subnet" {
  source      = "../../add-subnet"
  aws_region  = var.aws_region
  az          = var.az
  infra_id    = var.infra_id
  new_cidr    = var.new_cidr
  subnet_name = var.subnet_name
}
