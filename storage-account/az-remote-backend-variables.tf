# Deployment
variable "deploy" {
  type        = string
  description = "Name of deployment"
  default     = "lmt"
}
# Environment
variable "env" {
  type        = string
  description = "environment to be built"
  default     = "test"
}
# Azure region
variable "location" {
  type        = string
  description = "Azure region"
  default     = "West Europe"
}

# Account Kind
variable "account_kind" {
  type        = string
  description = "kind of storage"
  default     = "StorageV2"
}

# Account tier
variable "account_tier" {
  type        = string
  description = "Tier of storage"
  default     = "Standard"
}

# Access Tier
variable "access_tier" {
  type        = string
  description = "Access tier of storage"
  default     = "Hot"
}

# Account replication type
variable "account_replication_type" {
  type        = string
  description = "Account replication type"
  default     = "ZRS"
}

# Eenable https traffic only
variable "enable_https_traffic_only" {
  type        = string
  description = "enable_https_traffic_only"
  default     = true
}