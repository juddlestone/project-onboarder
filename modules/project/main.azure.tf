module "naming" {
  for_each = var.environments
  source   = "Azure/naming/azurerm"
  suffix   = concat(var.naming_suffix, [each.key])
}

resource "time_static" "this" {
  for_each = var.environments
}

resource "azurerm_storage_container" "this" {
  for_each              = var.environments
  name                  = "${var.repository_name}-${each.key}"
  storage_account_id    = var.backend_storage_account_id
  container_access_type = "private"
}

resource "azurerm_resource_group" "this" {
  provider = azurerm.production
  for_each = var.environments
  name     = module.naming[each.key].resource_group.name
  location = var.location
  tags     = var.tags
}

resource "azurerm_consumption_budget_resource_group" "this" {
  provider          = azurerm.production
  for_each          = var.environments
  name              = "budget-${var.budget_amount}-${each.key}"
  resource_group_id = azurerm_resource_group.this[each.key].id
  amount            = var.budget_amount

  time_period {
    start_date = formatdate("YYYY-MM-'01T00:00:00Z'", time_static.this[each.key].rfc3339)
  }

  notification {
    threshold      = 90.0
    operator       = "EqualTo"
    threshold_type = "Forecasted"

    contact_roles = [
      "Owner",
    ]
  }
}

resource "azurerm_user_assigned_identity" "this" {
  provider            = azurerm.production
  for_each            = var.environments
  name                = module.naming[each.key].user_assigned_identity.name
  resource_group_name = azurerm_resource_group.this[each.key].name
  location            = azurerm_resource_group.this[each.key].location
  tags                = var.tags
}

resource "azurerm_federated_identity_credential" "this" {
  provider            = azurerm.production
  for_each            = var.environments
  name                = "fic-${module.naming[each.key].user_assigned_identity.name}"
  resource_group_name = azurerm_resource_group.this[each.key].name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  parent_id           = azurerm_user_assigned_identity.this[each.key].id
  subject             = "repo:juddlestone/${github_repository.this.name}:ref:refs/heads/${each.key == "prd" ? "main" : each.key}"
}

resource "azurerm_role_assignment" "owner" {
  provider             = azurerm.production
  for_each             = var.environments
  scope                = azurerm_resource_group.this[each.key].id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.this[each.key].principal_id
}

resource "azurerm_role_assignment" "storage_blob_data_contributor" {
  for_each             = var.environments
  scope                = azurerm_storage_container.this[each.key].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.this[each.key].principal_id
}
