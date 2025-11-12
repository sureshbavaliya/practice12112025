variable "vm_name" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "nic_namea" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}
variable "subneta" {

}

variable "azurerm_virtual_network" {
  type = string

}
variable "admin_username" {
  type = string
  
}

variable "admin_password" {
  type = string
  
}

variable "publisher" {
  type = string

}
variable "offer" {
  type = string
}

variable "sku" {
  type = string
}