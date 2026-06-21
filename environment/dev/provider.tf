terraform {
    required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
    version = "4.40"
  }
}
 backend "azurerm" {
    resource_group_name  = "tappu-rg"
    storage_account_name = "stgtataaccount0101"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features { }
  subscription_id = "34cc9902-c707-4432-93a5-d466f2a325ab"
}