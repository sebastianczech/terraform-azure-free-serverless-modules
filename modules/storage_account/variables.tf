variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "prefix_name" {
  description = "The prefix for the name of the storage account"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}
