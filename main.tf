terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
  subscription_id = "acec003b-caf1-482b-ba40-29a3cdd690f9"
  client_id       = "b9079c46-ddcd-4c4f-bacd-ddc988eb6a5e"
  client_secret   = "psJ8Q~1yviUpp4yvgThZM5HaLoZ57VlSSa6uWa0u"
  tenant_id       = "afa32410-c43f-47dd-be3a-654fe6e46b88"
}

# Create Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Create Virtual Network
resource "azurerm_virtual_network" "example_vnet" {
  name                = "example-vnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

# Create Subnet within the Virtual Network
resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_storage_account" "example_storage" {
  name                     = "anil12345"  # Make sure the name is unique
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
}

# Network Interface for the VM
resource "azurerm_network_interface" "example_nic" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Output to show created resources
output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.example_vnet.name
}

output "storage_account_name" {
  value = azurerm_storage_account.example_storage.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.example_vm.name
}
