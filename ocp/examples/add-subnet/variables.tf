variable "infra_id" {
  description = "The infraID value from metadata.json"
  type        = string
}

variable "aws_region" {
  description = "The aws.region value from metadata.json"
  type        = string
}

variable "az" {
  description = "The availability zone where the new subnet should be deployed."
  type        = string
}

variable "new_cidr" {
  description = "The new CIDR to be added to the cluster"
  type        = string
}

variable "subnet_name" {
  description = "The name of the new subnet"
  type        = string
}
