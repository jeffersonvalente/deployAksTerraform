data "azure_client_config" "current" {}

resource "azuread_application" "spn" {
    display_name = var.SERVICE_PRINCIPAL_NAME
    owners = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "example" {
    application_id = azuread_application.spn.application_id
    app_role_assignment_required = true
    owners = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "spnpass" {
    service_principal_id = azuread_service_principal.example.object_id
}