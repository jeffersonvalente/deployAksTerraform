resource "azurerm_role_assignment" "rolespn" {
  scope= "/subscriptions/${var.SUBSCRIPTION_ID}"
  role_definition_name= "Contributor"
  principal_id = var.AKS_SPN
}