terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
 
  backend "azurerm" {
    resource_group_name  = "devsetup"
    storage_account_name = "remotestatedj"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id   = ""
}

