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
}

resource "azurerm_resource_group" "test_rg" {
  name     = "TestResourceGroup"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.test_rg.name
}
