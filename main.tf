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

resource "azurerm_resource_group" "test_rg" {
  name     = "TestResourceGroup"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.test_rg.name
}
