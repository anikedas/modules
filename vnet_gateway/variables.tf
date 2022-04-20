variable "public_ip_name" {
  description = "The variable for public ip name"
  type        = string
  default     = "bupa_public_ip"
}

variable "virtual_network_gateway" {
  description = "The variable for virtual network gateway name"
  type        = string
  default     = "bupa_vnet_gateway"
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = null
}

variable "sku_vnet_gateway" {
  description = "The variable for sku of vnet gateway name"
  type        = string
  default     = "Standard"
}

variable "vnet_gateway_ip_configuration" {
  description = "The variable for sku of vnet gateway name"
  type        = string
  default     = "bupavnetGatewayConfig"
}

variable "subnet_id" {
    type        = string
    description = "The ID of the Network Security Group which should be associated with the Subnet"
}

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
  default     = "Dynamic"
}

variable "enable_active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false."
  default     = false
}

variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false"
  default     = false
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased"
  default     = "RouteBased"
}


