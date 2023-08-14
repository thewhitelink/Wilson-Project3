provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "sa1780218823"
    container_name       = "container"
    key                  = "test.terraform.tfstate"
    access_key           = "vTXtWjtxrzctPwHKuDSYVwZbjsMStnZqrOllEt4cCdsu0pZeM2JVm4oTjahScGPIuUdtWgOVV/7s+AStRXnqsg=="
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${module.resource_group.resource_group_name}"
  address_prefix_test  = ["10.0.1.0/24"]
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = ["10.0.1.0/24"]
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "virtual_machine" {
  source               = "../../modules/vm"
  location             = "${var.location}"
  resource_group       = "${var.resource_group}"
  application_type     = "${var.application_type}"
  resource_type        = "VM"
  public_ip_address_id = "${module.publicip.public_ip_address_id}"
  public_subnet_id     = "${module.network.subnet_id_test}"
  admin_username       = "adminuser"
}