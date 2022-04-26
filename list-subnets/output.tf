output "public_subnets" {
  value = [
    data.aws_subnets.public_subnets.ids
  ]
}

output "private_subnets" {
  value = [
    data.aws_subnets.public_subnets.ids
  ]
}

output "subnets" {
  value = [
    data.aws_subnets.subnets.ids
  ]
}
