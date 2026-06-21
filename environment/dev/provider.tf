terraform {
    required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
    version = "4.40"
  }
}
}
provider "azurerm" {
  features { }
  subscription_id = "34cc9902-c707-4432-93a5-d466f2a325ab"
}