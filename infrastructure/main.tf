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

module "servicePrincipal" {
  source= "./modules/servicePrincipal"
  SERVICE_PRINCIPAL_NAME = var.SERVICE_PRINCIPAL_NAME

  depends_on = [
    azurerm_resource_group.main
  ]
}