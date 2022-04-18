resource "azurerm_resource_group" "default" {
  name     = "${var.prefix}-group"
  location = var.region
}