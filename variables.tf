variable "vnets" {
  type = map(object({
    address_space = string
    subnets = list(object({
      subnet_name    = string
      subnet_address = string
      #service_endpoints = list(string)
    }))
  }))

}

variable "resource_group_name_multiple" {
  description = "Default resource group name that the network will be created in."
  type        = list
}

variable "location" {
  description = "The location of the resource group"
}
