variable "name" {
  description = "The name of the Monitor Action Group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Monitor resources"
  type        = string
}

variable "short_name" {
  description = "The short name of the action group. This will be used as the abbreviated name for SMS messages"
  type        = string
}

variable "email_receiver_name" {
  description = "The name of the email receiver"
  type        = string
}

variable "email_receiver_address" {
  description = "The email address of the receiver"
  type        = string
}

variable "metric_alerts" {
  description = "List of metric alerts to create"
  type = list(object({
    name            = string
    scopes          = list(string)
    description     = string
    metric_namespace = string
    metric_name     = string
    aggregation     = string
    operator        = string
    threshold       = number
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
