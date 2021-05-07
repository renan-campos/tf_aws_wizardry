# Get vpc data.
data "aws_vpc" "env_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-vpc"]
  }

  filter {
    name   = "tag:kubernetes.io/cluster/${var.infra_id}"
    values = ["owned"]
  }
}

# Get the list of public subnets.
data "aws_subnet_ids" "env_vpc_public_subnets" {
  vpc_id = data.aws_vpc.env_vpc.id

  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-public-${var.aws_region}*"]
  }

  filter {
    name   = "tag:kubernetes.io/cluster/${var.infra_id}"
    values = ["owned"]
  }
}

data "aws_subnet" "public_subnets" {
  for_each = data.aws_subnet_ids.env_vpc_public_subnets.ids

  id = each.value
}

# Get the list of private subnets.
data "aws_subnet_ids" "env_vpc_private_subnets" {
  vpc_id = data.aws_vpc.env_vpc.id

  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-private-${var.aws_region}*"]
  }

  filter {
    name   = "tag:kubernetes.io/cluster/${var.infra_id}"
    values = ["owned"]
  }
}

data "aws_subnet" "private_subnets" {
  for_each = data.aws_subnet_ids.env_vpc_private_subnets.ids

  id = each.value
}

# Get the list of all subnets.
data "aws_subnet_ids" "env_vpc_subnets" {
  vpc_id = data.aws_vpc.env_vpc.id

  filter {
    name   = "tag:kubernetes.io/cluster/${var.infra_id}"
    values = ["owned"]
  }
}

data "aws_subnet" "subnets" {
  for_each = data.aws_subnet_ids.env_vpc_subnets.ids

  id = each.value
}
