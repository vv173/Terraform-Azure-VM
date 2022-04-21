output "instance_ip_addr" {
  value       = azurerm_public_ip.default.ip_address
  description = "The public IP address of the VM instance."

  depends_on = [
      azurerm_linux_virtual_machine.default
  ]
}