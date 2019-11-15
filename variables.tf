
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
  type        = list(string)
  default     = ["default"]
  description = "Namespaces in descending level of specificity, eg ['marge', 'kubernetes', 'prod', 'eus1']"
}

variable "name_seperator" {
  type        = string
  default     = "-"
  description = "Seperator to seperate names in name (default '-')"
}
