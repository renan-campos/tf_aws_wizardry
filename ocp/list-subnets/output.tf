output "public_subnets" {
  value = [
  for subnet in data.aws_subnet.public_subnets : "${subnet.id} : ${subnet.cidr_block}"
  ]
}

output "private_subnets" {
  value = [
  for subnet in data.aws_subnet.private_subnets : "${subnet.id} : ${subnet.cidr_block}"
  ]
}

output "subnets" {
  value = [
  for subnet in data.aws_subnet.subnets : "${subnet.id} : ${subnet.cidr_block}"
  ]
}
