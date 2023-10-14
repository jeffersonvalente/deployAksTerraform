terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}
resource "azurerm_resource_group" "main" {
  name     = var.RGNAME
  location = var.LOCATION
}
