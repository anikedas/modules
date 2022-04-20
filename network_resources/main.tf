data "azurerm_resource_group" "network" {
  name = var.resource_group_name
}



resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.key
  resource_group_name = data.azurerm_resource_group.network.name
  location            = data.azurerm_resource_group.network.location
  address_space       = [each.value.address_space]
}

resource "azurerm_subnet" "subnets" {
  for_each             = local.subnets
  name                 = each.value.subnet_name
  resource_group_name  = data.azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name
  address_prefixes     = [each.value.subnet_address]
  service_endpoints    = each.value.service_endpoints
}

