output "ds_rg_name" {
value = data. azurerm_resource_group.rgds.name
}


output "ds_rg_location" {
value   = data.azurerm_resource_group.rgds.location
}


output "ds_rg_id" {
value = data.azurerm_resource_group.rgds.id
}


output "ds_rg_tags" {
value = data.azurerm_resource_group.rgds.tags
}


output "network_interface_private_ip" {
description = "private ip addresses of the vm nics"
value       = azurerm_network_interface.nic.private_ip_address
}