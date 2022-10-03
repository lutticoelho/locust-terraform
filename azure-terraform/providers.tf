terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.98.0"
    }
  }
}

# PROVIDER
provider "azurerm" {
  # Configuration options
  features {}
}