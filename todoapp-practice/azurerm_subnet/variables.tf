variable "frontend_subnet" {
  type = string
}
variable "backend_subnet" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}
variable "subnet_address_prefixes1" {
  type = list(string)
}