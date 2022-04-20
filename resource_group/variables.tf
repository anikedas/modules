variable "resource_group_name_multiple" {
  description = "The resource group name multiple"
  type        = list(string)
}

variable "location" {
  description = "The location of the resource group"
}

variable "tags" {
  description = "tags"
  type        = map
  default     = {}
}
