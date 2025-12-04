variable "backend_storage_account_id" {
  description = "The ID of the storage account used for Terraform backend state."
  type        = string
}

variable "management_subscription_id" {
  description = "The Azure management subscription ID for role assignments."
  type        = string
}
