provider "aws" {
  region = var.aws_region
}

module "list-subnets" {
  source     = "github.com/renan-campos/tf_aws_wizardry/ocp/list-subnets"
  aws_region = var.aws_region
  infra_id   = var.infra_id
}

