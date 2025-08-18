resource "azurerm_public_ip" "pip" {
  name                    = var.pip-name
  location                = var.location
  resource_group_name     = var.rg-name
  allocation_method       = var.allocation_method
}