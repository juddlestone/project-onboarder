variable "backend_storage_account_id" {
  description = "The ID of the storage account used for Terraform backend state."
  type        = string
}

variable "production_subscription_id" {
  description = "The subscription where the resources will be deployed."
  type        = string
}

variable "management_subscription_id" {
  description = "The subscription used for management operations."
  type        = string
}

variable "github_token" {
  # Got to use a token for now as authenticating as an app within a 'personal' github account does not seem to be supported
  description = "The GitHub token used to authenticate with the GitHub provider."
  type        = string
}
