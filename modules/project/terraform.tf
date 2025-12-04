terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.54"

      configuration_aliases = [
        azurerm.production
      ]
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.8"
    }
  }
}
