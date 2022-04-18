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

  subnet {
    name           = "internal"
    address_prefix = "10.10.2.0/24"
    security_group = azurerm_network_security_group.default.id
  }

  # Tags should be added in the future.
  # tags = {
  #   environment = "Production"
  # }
}