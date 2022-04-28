variable "region" {
  type = string
}

variable "service_vpc_id" {
  type = string
}

variable "service_vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}
