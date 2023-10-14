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

module "security" {
  source= "./modules/security"
  AKS_SPN = var.AKS_SPN
  SUBSCRIPTION_ID = var.SUBSCRIPTION_ID

  depends_on = [
    azurerm_resource_group.main
  ]
}