resource "azurerm_network_interface" "nic" {
  name                = var.nic_namea
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_public_ip" "mypip" {
  name                = "pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

}

resource "azurerm_linux_virtual_machine" "frontend-vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = "azureuser" 
  admin_password                  = "Vikram@12345" 
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nic.id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "linux-osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}