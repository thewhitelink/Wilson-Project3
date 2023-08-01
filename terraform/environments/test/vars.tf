variable "subscription_id" {
    description = "Azure Sub Id"
    default = "f70deb8c-0341-408c-bc49-bee8e476e697"
}
variable "client_id" {
    description = ""
    default = "a30b5796-ce42-4f28-ac3b-a72162bf05be"
}
variable "client_secret" {
    description = ""
    default = "0j48Q~Vu24vHvXt-V5Rc39E1yh3IMZC4JaKbLcJG"
}
variable "tenant_id" {
    description = ""
    default = "838dd0ab-c484-4619-ac32-807ef6da0240"
}
variable "location" {
    description = ""
    default = "East US 2"
}
variable "resource_group" {
    description = ""
    default = "project3rg"
}
variable "application_type" {
    description = ""
    default = "EQR"
}
variable "virtual_network_name" {
    description = ""
    default = "EQR-VNET"
}
variable "address_space" {
    description = ""
    default = ["10.0.0.0/16"]
}
variable "address_prefix_test" {
    description = ""
    default = ["10.0.1.0/24"]
}
#variable "public_ip_address_id" {
#    description = ""
#    default = ""
#}
#variable "network_interface_ids" {
#    description = "NIC ID"
#    default = ""
#}