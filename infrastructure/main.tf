terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}
provider "azurerm" {
  subscription_id = var.SUBSCRIPTION_ID
  features {}
}
resource "azurerm_resource_group" "main" {
  name     = var.RGNAME
  location = var.LOCATION
}

module "keyvault" {
  source= "./modules/keyvault"
  RGNAME     = var.RGNAME
  LOCATION   = var.LOCATION
  AKS_SPN    = var.AKS_SPN
  AKS_SPN_PWD = var.AKS_SPN_PWD
  

  depends_on = [
    azurerm_resource_group.main
  ]
}