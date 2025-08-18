resource "azurerm_virtual_network" "Vnet1" {
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rg-name
}