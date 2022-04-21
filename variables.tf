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

variable "prefix" {
  type        = string
  description = "Defines prefix name for all resources."
}

variable "region" {
  type        = string
  description = "The Azure Region where the Resource Group should exist."
  default     = "West Europe"
}

variable "internal_dns" {
  type        = string
  description = "Internal DNS name"
}

variable "vm_size" {
  type        = string
  description = "Specifies the size of the Virtual Machine."
  default     = "Standard_B2s"
}

variable "hostname" {
  type        = string
  description = "Specifies the name of the Virtual Machine"
}

variable "username" {
  type        = string
  description = "Specifies the name of the local administrator account."
}

variable "password" {
  type        = string
  description = "The password associated with the local administrator account."
}

variable "disk_size" {
  type        = number
  description = "The Size of the Internal OS Disk in GB, cant be smaller then 30GB."
  default     = 30
}

variable "storage_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk."
  default     = "Standard_LRS"
}

variable "ssh_key_path" {
  type        = string
  description = "Path to the SSH Public key"
}