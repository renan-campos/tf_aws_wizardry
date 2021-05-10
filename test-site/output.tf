output "name" {
  value = var.site_name
}

output "az" {
  value = var.az
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "sub_cidr" {
  value = var.sub_cidr
}

output "probe_public_ip" {
  value = aws_eip.probe.public_ip
}

output "probe_private_ip" {
  value = sort(aws_network_interface.probe.private_ips)[0]
}

output "node_private_ip" {
  value = sort(aws_network_interface.node.private_ips)[0]
}

output "vpc_id" {
  value = aws_vpc.site.id
}

output "rt_id" {
  value = aws_route_table.site.id
}

output "subnet_id" {
  value = aws_subnet.site.id
}
