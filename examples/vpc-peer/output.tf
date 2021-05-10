output "site-a_info" {
  value = [for k, v in {
    name                = module.site-a.name
    "availability zone" = module.site-a.az
    "vpc cidr"          = module.site-a.vpc_cidr
    "subnet cidr"       = module.site-a.sub_cidr
    "probe public ip"   = module.site-a.probe_public_ip
    "probe private ip"  = module.site-a.probe_private_ip
    "node private ip"   = module.site-a.node_private_ip
    } : "${k} : ${v}"
  ]
}

output "site-b_info" {
  value = [for k, v in {
    name                = module.site-b.name
    "availability zone" = module.site-b.az
    "vpc cidr"          = module.site-b.vpc_cidr
    "subnet cidr"       = module.site-b.sub_cidr
    "probe public ip"   = module.site-b.probe_public_ip
    "probe private ip"  = module.site-b.probe_private_ip
    "node private ip"   = module.site-b.node_private_ip
    } : "${k} : ${v}"
  ]
}

output "site-c_info" {
  value = [for k, v in {
    name                = module.site-c.name
    "availability zone" = module.site-c.az
    "vpc cidr"          = module.site-c.vpc_cidr
    "subnet cidr"       = module.site-c.sub_cidr
    "probe public ip"   = module.site-c.probe_public_ip
    "probe private ip"  = module.site-c.probe_private_ip
    "node private ip"   = module.site-c.node_private_ip
    } : "${k} : ${v}"
  ]
}

output "peer-connections" {
  value = [for p in [
    module.peer-a-b.connection,
    module.peer-a-c.connection,
  ] : "${p}"]
}
