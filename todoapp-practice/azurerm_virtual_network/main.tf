resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_vnet
  location            = var.azurerm_virtual_vnet_location
  resource_group_name = var.azurerm_virtual_vnet_bhargav-rg
  address_space       = var.azurerm_virtual_vnet_address_space
}
