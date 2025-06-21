variable "prefix_name" {
  description = "The prefix name for the API Management instance"
  type        = string
}

variable "location" {
  description = "The Azure region where the API Management instance should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the API Management instance"
  type        = string
}

variable "publisher_name" {
  description = "The name of the publisher/company"
  type        = string
}

variable "publisher_email" {
  description = "The email of the publisher/company"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
