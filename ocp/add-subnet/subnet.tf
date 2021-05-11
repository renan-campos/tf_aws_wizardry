# Get vpc data.
data "aws_vpc" "cluster" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-vpc"]
  }

  filter {
    name   = "tag:kubernetes.io/cluster/${var.infra_id}"
    values = ["owned"]
  }
}

resource "aws_subnet" "added" {
  vpc_id     = data.aws_vpc.cluster.id
  cidr_block = var.new_cidr
  # Just using the first availability zone in the region for now.
  availability_zone = var.az

  tags = {
    Name                                    = "${var.infra_id}-${var.subnet_name}-${var.az}"
    "kubernetes.io/cluster/${var.infra_id}" = "owned"
  }
}

# Private OCP subnets route traffic to the public subnet on the availability zone
# through a nat gateway. 
# Here, the nat gateway is found and added to the route table for the new subnet.
data "aws_nat_gateway" "to_public" {
  filter {
    name   = "tag:Name"
    values = ["${var.infra_id}-nat-${var.az}"]
  }
}

resource "aws_route_table" "added" {
  vpc_id = data.aws_vpc.cluster.id
  tags = {
    Name = "${var.infra_id}-${var.subnet_name}-${var.az}"
  }
}

resource "aws_route" "gw" {
  route_table_id         = aws_route_table.added.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = data.aws_nat_gateway.to_public.id
}

resource "aws_route_table_association" "added" {
  subnet_id      = aws_subnet.added.id
  route_table_id = aws_route_table.added.id
}
