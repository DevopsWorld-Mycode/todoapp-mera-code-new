terraform {
  backend "azurerm" {
    resource_group_name = "rg-todostatefile"
    storage_account_name = "todostatestg"
    container_name = "todostatefile"
    key = "todoinfra.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "cd883195-4092-4235-89ce-a005b171ae9e"
 tenant_id = "a2c5272e-b6b0-4432-acee-5f70571b30e2"
}