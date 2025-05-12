variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "name" {
  description = "The name of the storage account"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}
