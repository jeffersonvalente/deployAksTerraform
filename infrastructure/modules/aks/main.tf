resource "azurerm_kubernetes_cluster" "main" {
  name                = "terraform-aks"
  location            = var.LOCATION
  resource_group_name = var.RGNAME
  dns_prefix          = "${var.RGNAME}-cluster"

  default_node_pool {
    name       = "default"
    node_count = "2"
    vm_size    = "Standard_B2s"
  }
  identity {
    type = "SystemAssigned"
  }
}