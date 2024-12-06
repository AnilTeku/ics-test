variable "subscription_id" {
  description = "The Azure Subscription ID where resources will be created."
  type        = string
}

variable "client_id" {
  description = "The Client ID of the Azure Service Principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Azure Service Principal."
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Tenant ID associated with the Azure Active Directory."
  type        = string
}
