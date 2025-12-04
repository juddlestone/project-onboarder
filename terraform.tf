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
  alias           = "production"
  subscription_id = var.production_subscription_id
  features {}
}

provider "github" {
}
