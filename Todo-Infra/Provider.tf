terraform {
  backend "azurerm" {
    resource_group_name = "rg-todostatefile"
    storage_account_name = "todostatestg1"
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
  subscription_id = "a87c6699-9b7e-4873-a0c4-8660499ba9ea"
 tenant_id = "d679bae9-8010-4a4c-a048-83977ede965d"
}