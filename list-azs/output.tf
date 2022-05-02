output "region" {
  value = data.aws_region.current.name
}

output "availability_zones" {
  value = [for name in data.aws_availability_zones.available.names : name]
}
