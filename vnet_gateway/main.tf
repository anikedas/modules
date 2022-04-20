data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name
  allocation_method   = var.public_ip_allocation_method
}

resource "azurerm_virtual_network_gateway" "vnetgw" {
  name                = var.virtual_network_gateway
  location            = data.azurerm_resource_group.vnet.location
  resource_group_name = data.azurerm_resource_group.vnet.name

  type     = "ExpressRoute"
  vpn_type = var.vpn_type

  active_active = var.enable_active_active
  enable_bgp    = var.enable_bgp
  sku           = var.sku_vnet_gateway

  ip_configuration {
    name                          = var.vnet_gateway_ip_configuration
    public_ip_address_id          = azurerm_public_ip.example.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}
