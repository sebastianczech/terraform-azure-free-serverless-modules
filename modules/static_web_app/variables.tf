variable "prefix_name" {
  description = "The prefix name for the Static Web App"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Static Web App"
  type        = string
}

variable "location" {
  description = "The Azure region where the Static Web App should be created"
  type        = string
}

variable "app_settings" {
  description = "A map of app settings to apply to the Static Web App"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
