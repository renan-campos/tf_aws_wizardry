# Get vpc data.
data "aws_vpc" "env_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-vpc"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-subnet-public*-${var.aws_region}*"]
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-subnet-private*-${var.aws_region}*"]
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-subnet-private*-${var.aws_region}*", "${var.infra_id}-subnet-public*-${var.aws_region}*"]
  }
}
