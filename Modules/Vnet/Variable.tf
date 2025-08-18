variable "name" {
  type = string
  description = "vnet1 name"
}
variable "address_space" {
    type = list(string)
  description = " address_space "
}
variable "rg-name" {
  type = string
  description = "rg_name"
}
variable "location" {
  type = string
}