locals {
  common_tags = {
    CreatedBy = "Project Onboarder"
  }

  project_data_dir = "${path.root}/.project_data"
  project_files    = fileset(local.project_data_dir, "project_*.json")
  projects = {
    for file in local.project_files :
    file => jsondecode(file("${local.project_data_dir}/${file}"))
  }
}
