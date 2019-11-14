
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags"
}

variable "timestamp_format" {
  type        = string
  default     = "YYYY-MM-DD'T'hh:mm:ssZ"
  description = "Timestamp format, see terraform.io/docs/configuration/functions/formatdate.html#specification-syntax"
}

locals {
  tags = merge(
    var.tags,
    {
      terraform_managed    = true
      terraform_workspace  = terraform.workspace
      terraform_applied_at = formatdate(var.timestamp_format, timestamp())
    }
  )
}

output "tags" {
  value = local.tags
}
