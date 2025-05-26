#--------------------------------------------*--------------------------------------------
#  Module: [Module Name] - Main
#--------------------------------------------*--------------------------------------------

# Example of a security issue: Storage Account without encryption
resource "azurerm_storage_account" "insecure_storage" {
  name                     = "insecurestorage"
  resource_group_name      = "example-resources"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # Missing encryption settings
}


# end
#--------------------------------------------*--------------------------------------------