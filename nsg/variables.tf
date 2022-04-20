variable "network_security_group_name" {
  type        = string
  description = "Specifies the name of the network security group"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the resource"
}

variable "location" {
    type        = string
    description = "Specifies the supported Azure location where the resource exists"
}

variable "security_rule" {
    type    = list(map(string))
    description = "A list map of the NSG rules"
    default = [
      {
        name                       = "DenyAllIn"
        priority                   = 4096
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range    = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
      name                       = "DenyAllOut"
      priority                   = 4096
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      },
    ]
}

variable "subnet_id" {
    type        = string
    description = "The ID of the subnet which should be associated with NSG"
}
