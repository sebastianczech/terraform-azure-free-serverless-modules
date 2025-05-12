variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "prefix_name" {
  description = "The prefix for the name of the Function App"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {}
}

variable "python_version" {
  description = "The version of Python to use"
  type        = string
  default     = "3.11"
}

variable "min_tls_version" {
  description = "The minimum TLS version to use"
  type        = string
  default     = "1.2"
}

variable "os_type" {
  description = "The OS type for the Function App"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU name for the Function App"
  type        = string
  default     = "Y1" # Consumption plan for free tier
}
