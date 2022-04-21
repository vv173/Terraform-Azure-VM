resource "azurerm_virtual_network" "default" {
  name                = "${var.prefix}-network"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  address_space       = ["10.10.0.0/16"]

  #Add subnet

  tags = {
    environment = "testing"
  }
}


resource "azurerm_subnet" "default" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefixes     = ["10.10.2.0/24"]
  #Security group and endpoints
}


resource "azurerm_public_ip" "default" {
  name                = "${var.prefix}-public_ip"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  allocation_method   = "Static"
  ip_version          = "IPv4"

  tags = {
    environment = "testing"
  }
}


resource "azurerm_network_interface" "default" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_servers         = ["1.1.1.1"]
  #dns servers variable
  internal_dns_name_label = var.internal_dns

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.default.id
  }
}