locals {
  common_tags = {
    CreatedDate = "${time_static.main.year}/${time_static.main.month}/${time_static.main.day}"
    CreatedBy   = "Project Onboarder"
  }

  project_data_dir = "${path.root}/.project_data"
  project_files    = fileset(local.project_data_dir, "project_*.json")
  projects = {
    for file in local.project_files :
    file => jsondecode(file("${local.project_data_dir}/${file}"))
  }
}
