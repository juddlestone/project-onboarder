resource "time_static" "main" {}

module "project" {
  source   = "./modules/project"
  for_each = local.projects

  providers = {
    azurerm.production = azurerm.production
  }

  backend_storage_account_id = var.backend_storage_account_id
  budget_amount              = each.value.budget_amount
  environments               = each.value.environments
  location                   = each.value.location
  naming_suffix              = each.value.naming_suffix
  repository_name            = each.value.repository_name
  repository_visibility      = each.value.repository_visibility
  subscription_id            = var.production_subscription_id
  tenant_id                  = data.azurerm_client_config.current.tenant_id

  tags = merge(local.common_tags, each.value.tags)
}
