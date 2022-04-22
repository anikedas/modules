   
variable "resource_group_name" {
  description = <<EOT
The name of the resource group in which to create the network security group.
The Resource Group must already exist.
EOT
  type        = string
}
variable "name" {
  description = <<EOT
The name of the network security group.
Changing this forces a new resource to be created.
EOT
  type        = string
}


# Custom security rules
# [priority, direction, access, protocol, source_port_range, destination_port_range, description]"
# All the fields are required.
variable "custom_rules" {
  description = <<EOT
Security rules for the network security group using this format:
  name = [
    priority,
    direction,
    access,
    protocol,
    source_port_range,
    destination_port_range,
    source_address_prefix,
    destination_address_prefix,
    description
  ]
EOT
  type        = any
  default     = [
    {
      name                   = "DenyAllIn"
      priority               = 4096
      direction              = "Inbound"
      access                 = "Deny"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "*"
      source_address_prefix  = "*"
      destination_address_prefix = "*"
      description            = "Deny all inbound ports"
    },
    {
     name                   = "DenyAllOut"
      priority               = 4096
      direction              = "Outbound"
      access                 = "Deny"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "*"
      source_address_prefix  = "*"
      destination_address_prefix = "*"
      description            = "Deny all outbound ports"
    },

  ]
}

