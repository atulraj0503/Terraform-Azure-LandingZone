resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = "/subscriptions/e64a1c57-d8a9-4f87-9ea5-b520e40433b6/resourceGroups/rg-bentec-dev/providers/Microsoft.Network/networkSecurityGroups/bentec-nsg"
}

resource "azurerm_linux_virtual_machine" "vm" {

  name                = "frontend-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2ats_v2"

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}