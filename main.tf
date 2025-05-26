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

resource "azurerm_virtual_machine" "insecure_vm" {
  name                  = "insecure-vm"
  location              = "West Europe"
  resource_group_name   = "example-resources"
  network_interface_ids = ["fake-nic-id"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password1234!"  # Hardcoded password is a security issue
  }
  
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# end
#--------------------------------------------*--------------------------------------------