locals {
  aws_region = "us-east-1"
}

provider "aws" {
  region = local.aws_region
}

module "site-a" {
  source    = "../../test-site"
  site_name = "site-a"
  vpc_cidr  = "10.0.0.0/16"
  sub_cidr  = "10.0.0.0/20"
  key_file  = "keys/aws-ssh.pub"
}

module "site-b" {
  source    = "../../test-site"
  site_name = "site-b"
  vpc_cidr  = "11.0.0.0/16"
  sub_cidr  = "11.0.0.0/20"
  key_file  = "keys/aws-ssh.pub"
}

module "site-c" {
  source    = "../../test-site"
  site_name = "site-c"
  vpc_cidr  = "11.1.0.0/16"
  sub_cidr  = "11.1.0.0/20"
  key_file  = "keys/aws-ssh.pub"
}

module "peer-a-b" {
  source        = "../../vpc-peer"
  hub_vpc_id    = module.site-a.vpc_id
  hub_rt_id     = module.site-a.rt_id
  hub_subnet_id = module.site-a.subnet_id

  spoke_vpc_id    = module.site-b.vpc_id
  spoke_rt_id     = module.site-b.rt_id
  spoke_subnet_id = module.site-b.subnet_id
}

module "peer-a-c" {
  source        = "../../vpc-peer"
  hub_vpc_id    = module.site-a.vpc_id
  hub_rt_id     = module.site-a.rt_id
  hub_subnet_id = module.site-a.subnet_id

  spoke_vpc_id    = module.site-c.vpc_id
  spoke_rt_id     = module.site-c.rt_id
  spoke_subnet_id = module.site-c.subnet_id
}
