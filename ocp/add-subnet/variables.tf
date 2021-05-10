variable "infra_id" {
  description = "infraID from metadata.json"
  type        = string
}

variable "aws_region" {
  description = "AWS region where cluster was created."
  type        = string
}

variable "new_cidr" {
  description = "The cidr to add to the cluster."
  type        = string
}

variable "subnet_name" {
  description = "Then name of the new subnet."
  type        = string
}

variable "az" {
  description = "The availablity zone where the subnet will be deployed"
  type        = string
}
