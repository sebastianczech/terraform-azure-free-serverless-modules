variable "name" {
  description = "The name of the Container App"
  type        = string
}

variable "environment_name" {
  description = "The name of the Container App Environment"
  type        = string
}

variable "location" {
  description = "The Azure region where the Container App should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container App"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to use for logging"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_image" {
  description = "The container image to deploy"
  type        = string
}

variable "cpu_cores" {
  description = "The number of CPU cores to allocate to the container"
  type        = number
  default     = 0.5 # Free tier eligible
}

variable "memory_size" {
  description = "The amount of memory to allocate to the container in GB"
  type        = string
  default     = "1Gi" # Free tier eligible
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
