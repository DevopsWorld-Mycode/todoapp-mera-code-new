module "rg" {
  source   = "../Modules/Resource_Group"
  Rg-name  = "rg-todoapp"
  location = "centralindia"
}
module "rg" {
  source   = "../Modules/Resource_Group"
  Rg-name  = "rg-git"
  location = "centralindia"
}

module "vnet1" {
  depends_on    = [module.rg]
  source        = "../Modules/Vnet"
  name          = "todovnet"
  rg-name       = "rg-todoapp"
  address_space = ["10.0.0.0/16"]
  location      = "centralindia"
}
module "subnet" {
  depends_on       = [module.vnet1]
  source           = "../Modules/Subnet"
  address_prefixes = ["10.0.1.0/24"]
  subnet_neme      = "frontend_subnet"
  rg-name          = "rg-todoapp"
  vnet             = "todovnet"
}
module "subnet1" {
  depends_on       = [module.vnet1]
  source           = "../Modules/Subnet"
  address_prefixes = ["10.0.2.0/24"]
  subnet_neme      = "backend_subnet"
  rg-name          = "rg-todoapp"
  vnet             = "todovnet"
}


module "pip1" {
  depends_on        = [module.rg]
  source            = "../Modules/Public-Ip"
  pip-name          = "todo-pip_frontend"
  location          = "centralindia"
  rg-name           = "rg-todoapp"
  allocation_method = "Static"
}
module "pip2" {
  depends_on        = [module.rg]
  source            = "../Modules/Public-Ip"
  pip-name          = "todo-pip_Backend"
  location          = "centralindia"
  rg-name           = "rg-todoapp"
  allocation_method = "Static"
}
module "azurerm_linux_virtual_machine_frontend" {
  depends_on                    = [module.pip1, module.subnet, module.vnet1, module.rg]
  source                        = "../Modules/virtual_machine"
  nicname                       = "todo-nic_frontend"
  location                      = "centralindia"
  resource_group_name           = "rg-todoapp"
  name_ipc                      = "todo-pip_frontend"
  private_ip_address_allocation = "Dynamic"
  vm_name                       = "frontend-vm"
  vm_size                       = "Standard_B1s"
  admin_user_name               = "devuser"
  admin_password                = "dev@123490"
  vnetname                      = "todovnet"
  subnetname                    = "frontend_subnet"

}
module "azurerm_linux_virtual_machine_backend" {
  depends_on                    = [module.pip2, module.rg, module.subnet1, module.vnet1]
  source                        = "../Modules/virtual_machine"
  nicname                       = "todo-nic_backend"
  location                      = "centralindia"
  resource_group_name           = "rg-todoapp"
  name_ipc                      = "todo-pip_backend"
  private_ip_address_allocation = "Dynamic"
  vm_name                       = "backend-vm"
  vm_size                       = "Standard_B1s"
  admin_user_name               = "devuser"
  admin_password                = "dev@123490"
  vnetname                      = "todovnet"
  subnetname                    = "backend_subnet"

}
module "sqlserver" {
  depends_on = [ module.rg ]
  source              = "../Modules/sql_server"
  sqlserver_name      = "todosqlserver551"
  resource_group_name = "rg-todoapp"
  location            = "centralindia"
  administrator_login = "todoapp_sqlserver"
  admin_password      = "StrongPass@2025"
  sql_version         = "12.0"
}

module "sql_db" {
  depends_on = [module.sqlserver]
  source     = "../Modules/Sql-database"
  sql_dbname = "todo_db"
  server_id  = module.sqlserver.sql_server_id
}
output "sql_server_id" {
  value = module.sqlserver.sql_server_id
}