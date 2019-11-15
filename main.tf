
locals {
  enforce_uppercase = lower(var.enforce_case) == "upper"
  enforce_lowercase = lower(var.enforce_case) == "lower"

  uncased_name = join(var.name_seperator, var.names)
  name = (
    local.enforce_uppercase ?
    upper(local.uncased_name) :
    local.enforce_lowercase ?
    lower(local.uncased_name) :
    local.uncased_name
  )

  local_tags = {
    Name                  = local.name
    terraform_managed     = true
    terraform_workspace   = terraform.workspace
    terraform_root_module = basename(path.root)
    terraform_module      = basename(path.module)
  }

  tags = merge(
    var.tags,
    local.local_tags
  )

  tags_as_list_of_maps = flatten([
    for key in keys(local.tags) : merge(
      {
        key   = key
        value = local.tags[key]
    })
  ])

}
