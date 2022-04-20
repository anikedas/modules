variable "resource_group_name" {
  description = "The variable for resource group name"
  type        = string
}

variable "subnet_name" {
  description = "The variable for subnet name"
  type        = string
  default     = "bupasubnet"
}


/*
variable "delegation_name" {
  description = "The variable for delegation name"
  type        = string
  default     = "None"
}

variable "delegation_service_name" {
  description = "The variable for service name for delegation"
  type        = string
  default     = "None"
}
*/

# variable "delegation_settings" {
#     type = list(map(string))
#     default = []
# }

variable "delegation" {
    type        = list(object({
                    service_name=string,
                    service_actions=list(string)
                  }))
    description = "A list of the subnet delegations"
    default     = []
}

variable "vnet_name" {
  description = "The CIDR block for the vnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The CIDR block for the vnet"
  type        = string 
  default     = ""
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
  default     = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.AzureCosmosDB",
    "Microsoft.EventHub",
    "Microsoft.KeyVault",
    "Microsoft.ServiceBus",
    "Microsoft.Sql",
    "Microsoft.Storage",
  ]
}
