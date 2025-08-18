data "azurerm_subnet" "subnetdata" {
  name                 = var.subnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "pip" {
  name                = var.name_ipc
  resource_group_name = var.resource_group_name
}

