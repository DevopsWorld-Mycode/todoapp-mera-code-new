terraform {
  backend "azurerm" {
    resource_group_name = "rg-todostatefile"
    storage_account_name = "todostatestg1509"
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
  subscription_id = "2e6daa7a-ebe4-4ded-a84b-db3eebdd9e98"
 tenant_id = "a717d505-5c6f-4202-b0ea-d81eadc6d237"
}