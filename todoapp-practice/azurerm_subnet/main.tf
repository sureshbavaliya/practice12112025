resource "azurerm_subnet" "frontend-subnet"{
  name                 = var.subneta
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes 
}
# resource "azurerm_subnet" "backend-subnet"{
#   name                 = var.subnetb
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.virtual_network_name
#   address_prefixes     = var.subnet_address_prefixes1
# }