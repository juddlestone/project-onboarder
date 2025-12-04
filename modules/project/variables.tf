variable "backend_storage_account_id" {
  description = "The ID of the storage account used for Terraform backend state."
  type        = string
}

variable "budget_amount" {
  description = "The budget amount for the project."
  type        = number
}

variable "environments" {
  description = "A map of environments to create branches for."
  type = map(object({
    branch_name = string
  }))
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "naming_suffix" {
  description = "A suffix to append to resource names."
  type        = list(string)
}

variable "repository_name" {
  description = "The name of the GitHub repository."
  type        = string
}

variable "repository_visibility" {
  description = "Whether the GitHub repository is private."
  type        = string
}

variable "repository_description" {
  description = "The description of the GitHub repository."
  type        = string
}

variable "repository_gitignore_template" {
  description = "The gitignore template to use for the GitHub repository."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID in which resources will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "tenant_id" {
  description = "The Azure tenant ID."
  type        = string
}
