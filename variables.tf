variable "subscription_id" {
  type        = string
  description = "The Subscription ID which should be used."
}

variable "tenant_id" {
  type        = string
  description = "The Tenant ID should be used. This also can be sourced from the service principal creation output as tenant"
}

variable "client_id" {
  type        = string
  description = "The Client ID which should be used.  This also can be sourced from the service principal creation output as appId"
}

variable "client_secret" {
  type        = string
  description = "The Client Secret which should be used.  This also can be sourced from the service principal creation output as password"
}