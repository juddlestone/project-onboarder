variable "backend_storage_account_id" {
  description = "The ID of the storage account used for Terraform backend state."
  type        = string
}

variable "production_subscription_id" {
  description = "The subscription where the resources will be deployed."
  type        = string
}
