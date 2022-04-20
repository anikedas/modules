resource "azurerm_resource_group" "rg" {
  count    = length(var.resource_group_name_multiple)
  name     = var.resource_group_name_multiple[count.index]
  location = var.location
  tags     = var.tags
}
