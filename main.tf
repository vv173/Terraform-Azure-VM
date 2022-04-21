resource "azurerm_resource_group" "default" {
  name     = "${var.prefix}-group"
  location = var.region
}

resource "azurerm_linux_virtual_machine" "default" {
  name                = "${var.prefix}-vm"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  network_interface_ids = [
    azurerm_network_interface.default.id
  ]
  size                            = var.vm_size
  encryption_at_host_enabled      = false
  computer_name                   = var.hostname
  disable_password_authentication = true


  admin_username = var.username
  admin_password = var.password
  admin_ssh_key {
    username   = var.username
    public_key = file("~/.ssh/azure-vm.pub")
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
    #List variable
  }

  os_disk {
    name                 = "${var.prefix}-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  tags = {
    environment = "testing"
  }
}