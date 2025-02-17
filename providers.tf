# configurer le provider azuread
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
}

provider "azuread" {
  # Configuration options
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}