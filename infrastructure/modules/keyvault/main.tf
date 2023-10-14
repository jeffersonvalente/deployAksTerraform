data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
resource "azurerm_key_vault" "akv" {
  name                       = "akv-terraform-aks"
  location                   = var.LOCATION
  resource_group_name        = var.RGNAME
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  enable_rbac_authorization = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
    ]
  }
}



resource "azurerm_key_vault_secret" "terraformspn" {
  name         = var.AKS_SPN
  value        = var.AKS_SPN_PWD
  key_vault_id = azurerm_key_vault.akv.id
}