resource "azurerm_resource_group" "res-0" {
  location = "eastus"
  name     = "rg-priyankadget"
}
resource "azurerm_windows_virtual_machine" "res-1" {
  admin_password        = "ignored-as-imported"
  admin_username        = "priyankastro"
  location              = "centralindia"
  name                  = "priyankadget"
  network_interface_ids = ["/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Network/networkInterfaces/priyankadget443"]
  resource_group_name   = "rg-priyankadget"
  size                  = "Standard_B2s"
  boot_diagnostics {
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.res-7,
  ]
}
resource "azurerm_dev_test_global_vm_shutdown_schedule" "res-2" {
  daily_recurrence_time = "1900"
  location              = "centralindia"
  timezone              = "UTC"
  virtual_machine_id    = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Compute/virtualMachines/priyankadget"
  notification_settings {
    email   = "Priyanka.Das@lntinfotech.com"
    enabled = true
  }
  depends_on = [
    azurerm_windows_virtual_machine.res-1,
  ]
}
resource "azurerm_dns_zone" "res-3" {
  name                = "priyankadget.com"
  resource_group_name = "rg-priyankadget"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_dns_a_record" "res-4" {
  name                = "api"
  resource_group_name = "rg-priyankadget"
  target_resource_id  = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Network/publicIPAddresses/priyankadget-ip"
  ttl                 = 3600
  zone_name           = "priyankadget.com"
  depends_on = [
    azurerm_dns_zone.res-3,
    azurerm_public_ip.res-13,
  ]
}
resource "azurerm_dns_ns_record" "res-5" {
  name                = "@"
  records             = ["ns1-09.azure-dns.com.", "ns2-09.azure-dns.net.", "ns3-09.azure-dns.org.", "ns4-09.azure-dns.info."]
  resource_group_name = "rg-priyankadget"
  ttl                 = 172800
  zone_name           = "priyankadget.com"
  depends_on = [
    azurerm_dns_zone.res-3,
  ]
}
resource "azurerm_network_interface" "res-7" {
  location            = "centralindia"
  name                = "priyankadget443"
  resource_group_name = "rg-priyankadget"
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Network/publicIPAddresses/priyankadget-ip"
    subnet_id                     = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Network/virtualNetworks/priyankadget-vnet/subnets/default"
  }
  depends_on = [
    azurerm_public_ip.res-13,
    azurerm_subnet.res-15,
  ]
}
resource "azurerm_network_interface_security_group_association" "res-8" {
  network_interface_id      = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Network/networkInterfaces/priyankadget443"
  network_security_group_id = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-priyankadget/providers/Microsoft.Network/networkSecurityGroups/priyankadget-nsg"
  depends_on = [
    azurerm_network_interface.res-7,
    azurerm_network_security_group.res-9,
  ]
}
resource "azurerm_network_security_group" "res-9" {
  location            = "centralindia"
  name                = "priyankadget-nsg"
  resource_group_name = "rg-priyankadget"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_network_security_rule" "res-10" {
  access                      = "Allow"
  description                 = "to run strapi"
  destination_address_prefix  = "*"
  destination_port_range      = "1337"
  direction                   = "Inbound"
  name                        = "AllowAnyCustom1337Inbound"
  network_security_group_name = "priyankadget-nsg"
  priority                    = 330
  protocol                    = "Tcp"
  resource_group_name         = "rg-priyankadget"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-9,
  ]
}
resource "azurerm_network_security_rule" "res-11" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Inbound"
  name                        = "AllowAnyHTTPInbound"
  network_security_group_name = "priyankadget-nsg"
  priority                    = 320
  protocol                    = "Tcp"
  resource_group_name         = "rg-priyankadget"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-9,
  ]
}
resource "azurerm_network_security_rule" "res-12" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "3389"
  direction                   = "Inbound"
  name                        = "RDP"
  network_security_group_name = "priyankadget-nsg"
  priority                    = 300
  protocol                    = "Tcp"
  resource_group_name         = "rg-priyankadget"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.res-9,
  ]
}
resource "azurerm_public_ip" "res-13" {
  allocation_method   = "Static"
  domain_name_label   = "strapi"
  location            = "centralindia"
  name                = "priyankadget-ip"
  resource_group_name = "rg-priyankadget"
  sku                 = "Standard"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_virtual_network" "res-14" {
  address_space       = ["10.0.0.0/16"]
  location            = "centralindia"
  name                = "priyankadget-vnet"
  resource_group_name = "rg-priyankadget"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_subnet" "res-15" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "default"
  resource_group_name  = "rg-priyankadget"
  virtual_network_name = "priyankadget-vnet"
  depends_on = [
    azurerm_virtual_network.res-14,
  ]
}
resource "azurerm_windows_web_app" "res-16" {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "5bc5c5f2-dc9b-4e25-94f4-e338baebbd2d"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=5bc5c5f2-dc9b-4e25-94f4-e338baebbd2d;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    XDT_MicrosoftApplicationInsights_Mode      = "Recommended"
  }
  client_affinity_enabled = true
  https_only              = true
  location                = "eastus"
  name                    = "app-test2-eastus"
  resource_group_name     = "rg-priyankadget"
  service_plan_id         = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/rg-TR/providers/Microsoft.Web/serverfarms/ASP-rgTR-ba2d"
  logs {
    application_logs {
      file_system_level = "Information"
    }
  }
  site_config {
    always_on  = false
    ftps_state = "FtpsOnly"
    virtual_application {
      physical_path = "site\\wwwroot"
      preload       = false
      virtual_path  = "/"
    }
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-20" {
  app_service_name    = "app-test2-eastus"
  hostname            = "app-test2-eastus.azurewebsites.net"
  resource_group_name = "rg-priyankadget"
  depends_on = [
    azurerm_windows_web_app.res-16,
  ]
}
resource "azurerm_monitor_smart_detector_alert_rule" "res-21" {
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  detector_type       = "FailureAnomaliesDetector"
  frequency           = "PT1M"
  name                = "Failure Anomalies - app-test2-eastus"
  resource_group_name = "rg-priyankadget"
  scope_resource_ids  = ["/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourcegroups/rg-priyankadget/providers/microsoft.insights/components/app-test2-eastus"]
  severity            = "Sev3"
  action_group {
    ids = ["/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourcegroups/rg-tr/providers/microsoft.insights/actiongroups/application insights smart detection"]
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
resource "azurerm_application_insights" "res-22" {
  application_type    = "web"
  location            = "eastus"
  name                = "app-test2-eastus"
  resource_group_name = "rg-priyankadget"
  sampling_percentage = 0
  workspace_id        = "/subscriptions/1988e0e4-7595-4e9a-91cb-242d277198f0/resourceGroups/DefaultResourceGroup-EUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-1988e0e4-7595-4e9a-91cb-242d277198f0-EUS"
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}
