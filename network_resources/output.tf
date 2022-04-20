output "vnet_names" {
  description = "The name of the virtual networks"
  value       = tomap({for k, v in azurerm_virtual_network.vnets: k => v.name})
} 

output "vnet_addresses" {
  description = "The name of the virtual networks"
  value       = tomap({for k, v in azurerm_virtual_network.vnets: k => v.address_space})
} 

output "subnet_names" {
  description = "The name of the subnets"
  value       = tomap({for k, v in azurerm_subnet.subnets: k => v.name})
} 

output "subnet_addresses" {
  description = "The name of the subnet addresses"
  value       = {for k, v in azurerm_subnet.subnets: k => v.address_prefixes}
} 

output "subnet_ids" {
  description = "The name of the subnet addresses"
  value       = tomap({for k, v in azurerm_subnet.subnets: k => v.id})
} 
