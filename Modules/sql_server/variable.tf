variable "sqlserver_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "administrator_login" {}
variable "admin_password" {}

variable "sql_version" {
  type    = string
  default = "12.0"  # You can override it from module call
}