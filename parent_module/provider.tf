terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "49702ce4-4c2c-4dad-9cc3-73a2bc356f8f"
}