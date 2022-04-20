output "name" {
  description = "The resource group name"
  value       = azurerm_resource_group.rg.*.name
}

output "id" {
  description = "The id of the resource group"
  value       = azurerm_resource_group.rg.*.id
}

output "location" {
  description = "The id of the resource group"
  value       = azurerm_resource_group.rg.*.location
}
