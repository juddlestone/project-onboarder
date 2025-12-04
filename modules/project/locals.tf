
locals {
  parsed_storage_account_id    = provider::azurerm::parse_resource_id(var.backend_storage_account_id)
  backend_resource_group_name  = local.parsed_storage_account_id["resource_group_name"]
  backend_storage_account_name = local.parsed_storage_account_id["resource_name"]

  # Common secrets shared across all environments
  common_secrets = {
    ARM_SUBSCRIPTION_ID              = var.subscription_id
    ARM_TENANT_ID                    = var.tenant_id
    ARM_BACKEND_RESOURCE_GROUP_NAME  = local.backend_resource_group_name
    ARM_BACKEND_STORAGE_ACCOUNT_NAME = local.backend_storage_account_name
  }

  # Merge common secrets with environment-specific client-id
  repository_secrets = merge(
    local.common_secrets,
    {
      for env_key in keys(var.environments) :
      "ARM_CLIENT_ID_${upper(env_key)}" => azurerm_user_assigned_identity.this[env_key].client_id
    }
  )
}
