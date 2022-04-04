
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
    Name                = local.name
    terraform_managed   = true
    terraform_workspace = terraform.workspace
  }

  tags = merge(
    local.local_tags,
    var.tags
  )

  tags_as_list_of_maps = flatten([
    for key in keys(local.tags) : merge(
      {
        key   = key
        value = local.tags[key]
    })
  ])

}
