output "command-for-connect" {
  value       = "ssh ${azurerm_linux_virtual_machine.mtc-vm.admin_username}@${azurerm_linux_virtual_machine.mtc-vm.public_ip_address}"
  description = "Login to the vm."
}

output "vm-public_ip_addr" {
  value       = azurerm_linux_virtual_machine.mtc-vm.public_ip_address
  description = "The public ip of the vm."
  # Security group rule must be created before this IP address could
  # actually be used, otherwise the services will be unreachable.
  depends_on = [azurerm_network_security_rule.mtc-dev-rule]
}
