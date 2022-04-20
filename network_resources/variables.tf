variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
  default     = null
}

variable "vnets" {
  type = map(object({
    address_space = string
    subnets = list(object({
      subnet_name    = string
      subnet_address = string
      service_endpoints = list(string)
    }))
  }))

  default = {
    "bupavnet1" = {
      address_space = "192.168.0.0/16",
      subnets       = []
    },
    "bupavnet2" = {
      address_space = "10.0.0.0/16",
      subnets = [
        {
          subnet_name    = "subnet1_bupavnet1"
          subnet_address = "10.0.2.0/24"
          service_endpoints = []
        },
        {
          subnet_name    = "subnet2_bupavnet1"
          subnet_address = "10.0.0.0/24"
          service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
          
        }
      ]
    },

    "bupavnet3" = {
      address_space = "10.80.0.0/16"
      subnets = [
        {
          subnet_name    = "subnet1_bupavnet3"
          subnet_address = "10.80.2.0/24"
          service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
        },

        {
          subnet_name    = "subnet2_bupavnet3"
          subnet_address = "10.80.1.0/24"
          service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
        },

        {
          subnet_name    = "subnet3_bupavnet3"
          subnet_address = "10.80.0.0/24"
          service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
        },
      ]
    }
  }
}
