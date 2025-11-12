module "resource_group" {
  source   = "../azurerm_resource_group"
  rg_name  = "virkram-rg"
  location = "centralindia"

}
module "azurerm_virtual_network" {
  depends_on                         = [module.resource_group]
  source                             = "../azurerm_virtual_network"
  azurerm_virtual_vnet               = "vnetsb"
  azurerm_virtual_vnet_location      = "centralindia"
  azurerm_virtual_vnet_bhargav-rg    = "bhargav-rg"
  azurerm_virtual_vnet_address_space = ["10.0.0.0/16"]

}
module "frontend-subnet" {
  depends_on              = [module.azurerm_virtual_network]
  source                  = "../azurerm_subnet"
  subneta                 = "frontend-subnet"
  resource_group_name     = "bhargav-rg"
  virtual_network_name    = "vnetsb"
  subnet_address_prefixes = ["10.0.1.0/24"]
}

module "backend-subnet" {
  depends_on              = [module.azurerm_virtual_network]
  source                  = "../azurerm_subnet"
  subneta                 = "frontend-subnet"
  resource_group_name     = "bhargav-rg"
  virtual_network_name    = "vnetsb"
  subnet_address_prefixes = ["10.0.1.0/24"]
}


module "linux_vm" {
  depends_on              = [module.resource_group, module.azurerm_virtual_network, module.frontend-subnet]
  source                  = "../azurerm_virtual_machine"
  nic_namea               = "nic-frontend"
  location                = "centralindia"
  resource_group_name     = "bhargav-rg"
  subneta                 = "frontend-subnet"
  vm_name                 = "sbfrontend"
  vm_size                 = "Standard_F2"
  admin_username          = "azureuser"
  admin_password          = "Vikram@12345"
  publisher               = "Canonical"
  offer                   = "0001-com-ubuntu-server-jammy"
  sku                     = "22_04-lts"
  azurerm_virtual_network = "vnetsb"

}

