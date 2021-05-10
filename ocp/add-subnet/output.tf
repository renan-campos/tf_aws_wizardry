output "subnet_added" {
  value = "${aws_subnet.added.id} : ${aws_subnet.added.cidr_block}"
}
