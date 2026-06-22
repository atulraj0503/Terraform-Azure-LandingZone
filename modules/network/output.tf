output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "frontend_subnet_id" {
  value = azurerm_subnet.frontend.id
}

output "backend_subnet_id" {
  value = azurerm_subnet.backend.id
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion.id
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgw.id
}