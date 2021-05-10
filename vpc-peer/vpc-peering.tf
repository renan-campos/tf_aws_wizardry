# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "spoke" {
  vpc_id      = data.aws_vpc.spoke.id
  peer_vpc_id = data.aws_vpc.hub.id
  auto_accept = true
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "hub" {
  vpc_peering_connection_id = aws_vpc_peering_connection.spoke.id
  auto_accept               = true
}

# Requester routes
resource "aws_route" "spoke_to_hub" {
  route_table_id            = data.aws_route_table.spoke.id
  destination_cidr_block    = data.aws_subnet.hub.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.spoke.id
  depends_on                = [data.aws_route_table.spoke]
}

# Accepter routes
resource "aws_route" "hub_to_spoke" {
  route_table_id            = data.aws_route_table.hub.id
  destination_cidr_block    = data.aws_subnet.spoke.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.hub.id
  depends_on                = [data.aws_route_table.hub]
}
