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
  secure_boot_enabled             = false


  admin_username = var.username
  admin_password = var.password
  admin_ssh_key {
    username   = var.username
    public_key = file(var.ssh_key_path)
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
    #List variable
  }


  os_disk {
    name                 = "${var.prefix}-disk"
    caching              = "ReadWrite"
    storage_account_type = var.storage_type
    disk_size_gb         = var.disk_size
  }


  tags = {
    environment = "testing"
  }
}