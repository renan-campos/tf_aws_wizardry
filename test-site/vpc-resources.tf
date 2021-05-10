resource "aws_vpc" "site" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "site" {
  vpc_id = aws_vpc.site.id
}

resource "aws_route_table" "site" {
  vpc_id = aws_vpc.site.id
}

# Send all IPv4 traffic to the internet gateway
resource "aws_route" "ipv4_egress_route" {
  route_table_id         = aws_route_table.site.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.site.id
  depends_on             = [aws_route_table.site]
}

# Send all IPv6 traffic to the internet gateway
resource "aws_route" "ipv6_egress_route" {
  route_table_id              = aws_route_table.site.id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.site.id
  depends_on                  = [aws_route_table.site]
}

resource "aws_subnet" "site" {
  vpc_id            = aws_vpc.site.id
  cidr_block        = var.sub_cidr
  availability_zone = var.az
}

resource "aws_route_table_association" "site" {
  subnet_id      = aws_subnet.site.id
  route_table_id = aws_route_table.site.id
}
