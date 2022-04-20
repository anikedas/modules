vnets = {
    "bupavnet1" = {
      address_space = "192.168.0.0/16",
      subnets       = [
        {
          subnet_name    = "subnet1_bupavnet1"
          subnet_address = "192.168.1.0/24"
          service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
        }          
      ]
    },
    "bupavnet2" = {
      address_space = "10.0.0.0/16",
      subnets = [
        {
          subnet_name    = "subnet1_bupavnet2"
          subnet_address = "10.0.2.0/24"
          service_endpoints = ["Microsoft.AzureCosmosDB","Microsoft.ContainerRegistry"]
        },
        {
          subnet_name    = "subnet2_bupavnet2"
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

   resource_group_name_multiple = ["multirg3","multrg4"]

   location                = "Australia East"
