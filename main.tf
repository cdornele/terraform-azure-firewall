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

resource "azurerm_network_security_group" "insecure_nsg" {
  name                = "insecure-nsg"
  location            = "West Europe"
  resource_group_name = "example-resources"

  security_rule {
    name                       = "allow-all"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


# end
#--------------------------------------------*--------------------------------------------