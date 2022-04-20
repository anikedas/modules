terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.98.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg2"
  location = "Australia East"
}

module "network" {
  source = "./network_resources"
  #vnets = var.vnets
  resource_group_name = azurerm_resource_group.rg2.name
  location = azurerm_resource_group.rg2.location
}

module "nsg_bupatest4"{
  source                          = "./nsg"
  network_security_group_name     = "nsg-subnet3"
  resource_group_name             = azurerm_resource_group.rg2.name
  location                        = azurerm_resource_group.rg2.location
  subnet_id                       = module.network.subnet_ids["subnet3_bupavnet3"]
  }


# \\using resource group module

# module "resource_group" {
#   source                  = "./resource_group"
#   resource_group_name_multiple = var.resource_group_name_multiple
#   location                = var.location
# }



# module "network" {
#   source = "./network_resources"
#   vnets = var.vnets
#   count = length(module.resource_group[*].name)
#   resource_group_name = module.resource_group.name[0]
#   location = module.resource_group.location[0]

# }



# resource "azurerm_virtual_network" "vnets" {
#   for_each            = var.vnets
#   name                = each.key
#   resource_group_name = azurerm_resource_group.rg2.name
#   location            = azurerm_resource_group.rg2.location
#   address_space       = [each.value.address_space]
# }

# locals {
#   subnets_flatlist = flatten([for key, val in var.vnets : [
#     for subnet in val.subnets : {
#       vnet_name      = key
#       subnet_name    = subnet.subnet_name
#       subnet_address = subnet.subnet_address
#       service_endpoints = subnet.service_endpoints
#     }
#     ]
#   ])

#   subnets = { for subnet in local.subnets_flatlist : subnet.subnet_name => subnet }
# }



# resource "azurerm_subnet" "subnets" {
#   for_each             = local.subnets
#   name                 = each.value.subnet_name
#   resource_group_name  = azurerm_resource_group.rg2.name
#   virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name
#   address_prefixes     = [each.value.subnet_address]

# }



# module "nsg_bupatest4"{
#   source                          = "./nsg"
#   network_security_group_name     = "nsg-subnet3"
#   resource_group_name             = azurerm_resource_group.rg2.name
#   location                        = azurerm_resource_group.rg2.location
#   subnet_id                       = module.network.subnet_ids["subnet3_bupavnet3"]
#   }




# resource "azurerm_management_lock" "resource-group-level" {
#   name       = "resource-group-level"
#   scope      = azurerm_resource_group.example.id
#   lock_level = "CanNotDelete"
#   notes      = "No resources can be deleted"
# }



# locals {
#     delegation_settings = [{
#     subnet_delegation_name         = "app-service-delegation"
#     subnet_service_delegation_name = "Microsoft.Web/serverFarms"
#     },
#     {
#     subnet_delegation_name         = "container-service-delegation"
#     subnet_service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
#     }
#     ]
# }



# module "subnet" {
#   source                  = "./subnet"
#   resource_group_name     = azurerm_resource_group.example.name
#   vnet_name               = module.vnet.vnet_name
#   subnet_name             = "bupatest3"
#   subnet_address_prefixes = "10.0.0.0/24"
#   delegation              = [{service_name = "Microsoft.Databricks/workspaces",service_actions =[]}]
#   service_endpoints       = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
# }





# # resource "azurerm_public_ip" "example" {
# #   name                = "test"
# #   location            = azurerm_resource_group.example.location
# #   resource_group_name = azurerm_resource_group.example.name
# #   allocation_method = "Dynamic"
# # }

# # resource "azurerm_virtual_network_gateway" "example" {
# #   name                = "test"
# #   location            = "West Europe"
# #   resource_group_name = azurerm_resource_group.example.name

# #   type     = "ExpressRoute"
# #   vpn_type = "RouteBased"

# #   active_active = false
# #   enable_bgp    = false
# #   sku           = "Standard"

# #   ip_configuration {
# #     name                          = "vnetGatewayConfig"
# #     public_ip_address_id          = azurerm_public_ip.example.id
# #     private_ip_address_allocation = "Dynamic"
# #     subnet_id                     = module.subnet4.subnet_id
# #   }
# # }

# module vnetgwdev {
#   source                  = "./vnet_gateway"
#   resource_group_name     = azurerm_resource_group.example.name
#   location                = azurerm_resource_group.example.location
#   public_ip_name          = "testpublicip"
#   vpn_type                = "RouteBased"
#   virtual_network_gateway = "test"
#   sku_vnet_gateway        = "UltraPerformance"
#   subnet_id               = module.subnet4.subnet_id
# }



