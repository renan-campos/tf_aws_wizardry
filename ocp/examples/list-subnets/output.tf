output "public_subnets" {
  value = module.list-subnets.public_subnets
}

output "private_subnets" {
  value = module.list-subnets.private_subnets
}

output "all_subnets" {
  value = module.list-subnets.subnets
}
