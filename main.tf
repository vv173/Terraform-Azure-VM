resource "azurerm_resource_group" "default" {
  name     = "${var.prefix}-group"
  location = var.region
}

resource "azurerm_network_security_group" "default" {
  name                = "${var.prefix}-security-group"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
}

resource "azurerm_virtual_network" "default" {
  name                = "${var.prefix}-network"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  address_space       = ["10.10.0.0/16"]

  # Tags should be added in the future.
  # tags = {
  #   environment = "Production"
  # }
}

resource "azurerm_subnet" "default" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_network_interface" "default" {
  name                    = "${var.prefix}-nic"
  location                = azurerm_resource_group.default.location
  resource_group_name     = azurerm_resource_group.default.name
  dns_servers             = ["1.1.1.1"]
  internal_dns_name_label = var.internal_dns
  #public_ip_address_id = 

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Static"
  }
}