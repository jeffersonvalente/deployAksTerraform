data "azurerm_kubernetes_service_versions" "current" {
  location = var.LOCATION
  include_preview = false  
}
 

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                  = "terraform-aks"
  location              = var.LOCATION
  resource_group_name   = var.RGNAME
  dns_prefix            = "${var.RGNAME}-cluster"           
  kubernetes_version    =  data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${var.RGNAME}-nrg"
  
  default_node_pool {
    name       = "defaultpool"
    vm_size    = "Standard_DS2_v2"
    zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 2
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "prod"
      "nodepoolos"       = "linux"
     } 
   tags = {
      "nodepool-type"    = "system"
      "environment"      = "prod"
      "nodepoolos"       = "linux"
   } 
  }

  service_principal  {
    client_id = var.AKS_SPN
    client_secret = var.AKS_SPN_PWD
  }



  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
        key_data = file(var.SSH_PUBLIC_KEY)
    }
  }

  network_profile {
      network_plugin = "azure"
      load_balancer_sku = "standard"
  }

    
  }