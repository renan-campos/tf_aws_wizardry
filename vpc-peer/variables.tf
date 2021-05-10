variable "spoke_vpc_id" {
  description = "The vpc id of the spoke site."
  type        = string
}

variable "spoke_rt_id" {
  description = "The route table id of the spoke site."
  type        = string
}

variable "spoke_subnet_id" {
  description = "The subnet to be peered on the spoke site."
  type        = string
}

variable "hub_vpc_id" {
  description = "The vpc id of the hub site."
  type        = string
}

variable "hub_rt_id" {
  description = "The route table id of the hub site."
  type        = string
}

variable "hub_subnet_id" {
  description = "The subnet to be peered on the hub site."
  type        = string
}
