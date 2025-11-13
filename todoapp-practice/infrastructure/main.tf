module "resource_group" {
  source   = "../azurerm_resource_group"
  rg_name  = "vikram-rg"
  location = "centralindia"

}
module "azurerm_virtual_network" {
  depends_on                         = [module.resource_group]
  source                             = "../azurerm_virtual_network"
  azurerm_virtual_vnet               = "vnetsb"
  location                           = "centralindia"
  resource_group_name                = "vikram-rg"
  azurerm_virtual_vnet_address_space = ["10.0.0.0/16"]

}
module "subneta" {
  depends_on               = [module.azurerm_virtual_network, module.resource_group]
  source                   = "../azurerm_subnet"
  frontend_subnet          = "frontend-subnet"
  backend_subnet           = "backend-subnet"
  resource_group_name      = "vikram-rg"
  virtual_network_name     = "vnetsb"
  subnet_address_prefixes  = ["10.0.1.0/24"]
  subnet_address_prefixes1 = ["10.0.2.0/24"]
}

module "frontend_vm" {
  depends_on          = [module.azurerm_virtual_network, module.subneta, module.resource_group]
  source              = "../azurerm_virtual_machine"
  resource_group_name = "vikram-rg"
  location            = "centralindia"
  vnet_name           = "vnetsb"
  subnet_name         = "frontend-subnet"
  vm_name             = "frontendvm"
  nic_name            = "nic-frontend"
  vm_size             = "Standard_F2"
  admin_username      = "azureuser"
  admin_password      = "Vikram@12345"
  publisher           = "Canonical"
  offer               = "UbuntuServer"
  sku                 = "22_04-lts"
}

module "backend_vm" {
  depends_on          = [module.azurerm_virtual_network, module.subneta, module.resource_group]
  source              = "../azurerm_virtual_machine"
  resource_group_name = "vikram-rg"
  location            = "centralindia"
  vnet_name           = "vnetsb"
  subnet_name         = "backen-subnet"
  vm_name             = "backenddvm"
  nic_name            = "nic-frontend"
  vm_size             = "Standard_F2"
  admin_username      = "azureuser"
  admin_password      = "Vikram@12345"
  publisher           = "Canonical"
  offer               = "UbuntuServer"
  sku                 = "22_04-lts"
}
