data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}


resource "azurerm_subnet" "module_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefix       = var.subnet_address_prefixes
  service_endpoints    = var.service_endpoints


# dynamic "delegation" {
#     for_each = var.delegation_settings
#     content {
#       name = delegation.value["subnet_delegation_name"]
#       service_delegation {
#       name = delegation.value["subnet_service_delegation_name"]
#       }
#     }
#   }

  dynamic "delegation" {
      for_each = var.delegation != null ? var.delegation : []
      content {
        name = "delegation"
        service_delegation {
            name    = delegation.value["service_name"]
            actions = delegation.value["service_actions"]
        }
      }
  }
}



