data "azurerm_subnet" "subnet" {
  name                 = var.subneta
  virtual_network_name = var.azurerm_virtual_network
  resource_group_name  = var.resource_group_name
}


data "azurerm_network_interface" "nic" {
  name                = var.nic_namea
  resource_group_name = var.resource_group_name
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
#   name         = "vmpassword"
#   key_vault_id = data.azurerm_key_vault.kv.id
# }
