resource "github_repository" "this" {
  name               = var.repository_name
  visibility         = var.repository_visibility
  description        = var.repository_description
  gitignore_template = var.repository_gitignore_template
  topics             = var.repository_topics
  auto_init          = true
}

resource "github_branch" "this" {
  for_each   = var.environments
  repository = github_repository.this.name
  branch     = each.key == "prd" ? "main" : each.key
}

resource "github_actions_secret" "this" {
  for_each        = local.repository_secrets
  repository      = github_repository.this.name
  secret_name     = each.key
  plaintext_value = each.value
}
