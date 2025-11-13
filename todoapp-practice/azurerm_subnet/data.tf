data "azurerm_subnet" "frontend_subnet" {
  name                 = var.frontend_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}

data "azurerm_subnet" "backend_subnet" {
  name                 = var.backend_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}