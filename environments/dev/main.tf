module "resource_group" {
  source = "../../modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source = "../../modules/network"

  vnet_name           = "bentec-vnet"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  address_space = ["10.0.0.0/16"]
}
module "nsg" {
  source = "../../modules/nsg"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
}
module "vm" {

  source = "../../modules/vm"

  resource_group_name = module.resource_group.resource_group_name

  location = module.resource_group.resource_group_location

  subnet_id = module.network.frontend_subnet_id

  admin_username = var.admin_username

  admin_password = var.admin_password
}
module "bastion" {

  source = "../../modules/bastion"

  resource_group_name = module.resource_group.resource_group_name

  location = module.resource_group.resource_group_location

  bastion_subnet_id = module.network.bastion_subnet_id
}

module "applicationgateway" {

  source = "../../modules/applicationgateway"

  resource_group_name = module.resource_group.resource_group_name

  location = module.resource_group.resource_group_location

  subnet_id = module.network.appgw_subnet_id

  backend_ip = "10.0.1.4"
}