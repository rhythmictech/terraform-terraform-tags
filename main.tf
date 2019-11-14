
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags. Overwrite module-generated tags"
}

variable "timestamp_format" {
  type        = string
  default     = "YYYY-MM-DD'T'hh:mm:ssZ"
  description = "Timestamp format, see terraform.io/docs/configuration/functions/formatdate.html#specification-syntax"
}

variable "enforce_case" {
  type        = string
  default     = "None"
  description = "Type casing to enforce. Options are: [ None (default) | UPPER | lower ]"
}

variable "names" {
  type        = set(string)
  default     = ["default"]
  description = "Namespaces in ascending level of specificity, eg ['eus1', 'prod', 'kubernetes', 'marge']"
}

variable "name_seperator" {
  type        = string
  default     = "-"
  description = "Seperator to seperate names in name (default '-')"
}

locals {
  enforce_uppercase = lower(var.enforce_case) == "upper"
  enforce_lowercase = lower(var.enforce_case) == "lower"

  uncased_name = join(var.name_seperator, var.names)
  name         = local.enforce_uppercase ? upper(local.uncased_name) : local.enforce_lowercase ? lower(local.uncased_name) : local.uncased_name

  local_tags = {
    Name                  = local.name
    terraform_managed     = true
    terraform_workspace   = terraform.workspace
    terraform_applied_at  = formatdate(var.timestamp_format, timestamp())
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

output "name" {
  description = ""
  value       = local.name
}

output "tags" {
  description = "Tags as a map"
  value       = local.tags
}

output "tags_as_list_of_maps" {
  description = "Tags as a list of maps, to make things like tagging ECS simple"
  value       = local.tags_as_list_of_maps
}
