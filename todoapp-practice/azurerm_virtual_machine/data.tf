data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "frontend_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}

data "azurerm_subnet" "backend_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}
# data "azurerm_key_vault" "kv" {
#   name                = "demosbkv"
#   resource_group_name = "kv-rg"
# }

# data "azurerm_key_vault_secret" "kv-username" {
#   name         = "vmusername"
#   key_vault_id = data.azurerm_key_vault.kv.id
# }

# data "azurerm_key_vault_secret" "kv-password" {
#   name         = "vmpassword"1//.,mn bvc`cvb+98/7
#   key_vault_id = data.azurerm_key_vault.kv.id
# }
