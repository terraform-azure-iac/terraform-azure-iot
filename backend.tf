terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  } 
  
  backend "azurerm" {
            resource_group_name  = "terraformbackend"
            storage_account_name = "terraformbackendxxyygg"
            container_name       = "terraformbackend"
            key                  = "case-iot.tfstate"
    }
}

   




provider "azurerm" {
  features {}

  # Authentication
}