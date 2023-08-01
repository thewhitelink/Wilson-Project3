resource "azurerm_network_interface" "int" {
  name                = "NIC-${var.resource_type}-${var.application_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.public_subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "VM" {
  name                  = "${var.resource_type}-${var.application_type}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group}"
  size                  = "Basic_A1"
  admin_username        = "${var.admin_username}"
  network_interface_ids = [
    azurerm_network_interface.int.id
  ]
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
#  admin_ssh_key {
#    username   = var.admin_username
#    public_key = file("/home/vsts/work/_temp/id_rsa.pub")
#  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
