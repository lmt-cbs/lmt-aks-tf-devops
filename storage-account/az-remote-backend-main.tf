# Generate a random storage name
provider "azurerm" {
  features {}
}
resource "random_string" "tf-name" {
  length  = 8
  upper   = false
  numeric = true
  lower   = true
  special = false
}

# Create a Resource Group for the Terraform State File
resource "azurerm_resource_group" "state-rg" {
  name     = "${var.deploy}-terraform-state"
  location = var.location

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    environment = var.env
  }
}

# Create a Storage Account for the Terraform State File
resource "azurerm_storage_account" "state-sta" {
  depends_on                = [azurerm_resource_group.state-rg]
  name                      = "${lower(var.deploy)}tf${random_string.tf-name.result}"
  resource_group_name       = azurerm_resource_group.state-rg.name
  location                  = azurerm_resource_group.state-rg.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  access_tier               = var.access_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

 lifecycle {
   prevent_destroy = true
 }
  tags = {
    environment = var.env
  }
}
# Create a Storage Container for the Core State File
resource "azurerm_storage_container" "core-container" {
  depends_on           = [azurerm_storage_account.state-sta]
  name                 = "${lower(var.deploy)}-core-state"
  storage_account_name = azurerm_storage_account.state-sta.name
}