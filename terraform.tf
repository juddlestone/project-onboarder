terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.54"
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.8"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = var.management_subscription_id
  features {}
}

provider "github" {
}
