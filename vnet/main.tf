data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "bupaanz-${var.vnet_name}"
  resource_group_name = data.azurerm_resource_group.vnet.name
  location            = var.vnet_location != null ? var.vnet_location : data.azurerm_resource_group.vnet.location
  address_space       = var.address_space
}
