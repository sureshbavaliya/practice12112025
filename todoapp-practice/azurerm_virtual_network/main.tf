resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_vnet
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.azurerm_virtual_vnet_address_space
}
