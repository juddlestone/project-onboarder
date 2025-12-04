terraform {
  backend "azurerm" {
    use_azuread_auth = true
    use_oidc         = true
  }

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
  storage_use_azuread = true
  features {}
}

provider "azurerm" {
  alias               = "production"
  subscription_id     = var.production_subscription_id
  storage_use_azuread = true
  features {}
}

provider "github" {
}
