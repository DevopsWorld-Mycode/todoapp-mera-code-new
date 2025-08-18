resource "azurerm_subnet" "subnet" {
  name = var.subnet_neme
  virtual_network_name = var.vnet
  resource_group_name = var.rg-name
  address_prefixes = var.address_prefixes
}