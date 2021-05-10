data "aws_vpc" "spoke" {
  id = var.spoke_vpc_id
}

data "aws_vpc" "hub" {
  id = var.hub_vpc_id
}

data "aws_route_table" "spoke" {
  route_table_id = var.spoke_rt_id
}

data "aws_route_table" "hub" {
  route_table_id = var.hub_rt_id
}

data "aws_subnet" "spoke" {
  id = var.spoke_subnet_id
}

data "aws_subnet" "hub" {
  id = var.hub_subnet_id
}
