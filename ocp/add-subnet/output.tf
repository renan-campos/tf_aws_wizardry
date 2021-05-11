output "subnet_added" {
  value = "${aws_subnet.added.id} : ${aws_subnet.added.cidr_block}"
}

output "vpc_id" {
  value = data.aws_vpc.cluster.id
}

output "rt_id" {
  value = aws_route_table.added.id
}

output "subnet_id" {
  value = aws_subnet.added.id
}
