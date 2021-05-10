output "connection" {
  value = "${data.aws_subnet.hub.cidr_block} <-> ${data.aws_subnet.spoke.cidr_block}"
}
