output "service_principal_name" {
    value = azuread_service_principal.example.display_name
}

output "service_principal_object_id" {
    value = azuread_service_principal.example.object_id
}

output "service_principal_tenant_id" {
    value = azuread_service_principal.example.application_tenant_id
}

output "service_principal_application_id" {
    value = azuread_service_principal.example.application_id
}

output "client_id" {
    value = azuread_application.spn.application_id
}

output "client_secret" {
    value = azuread_service_principal_password.spnpass.value
}