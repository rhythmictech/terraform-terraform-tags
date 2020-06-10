
variable "enforce_case" {
  default     = "None"
  description = "Type casing to enforce. Options are: [ None (default) | UPPER | lower ]"
  type        = string
}

variable "names" {
  default     = ["default"]
  description = "Namespaces in descending level of specificity, eg ['marge', 'kubernetes', 'prod', 'eus1']"
  type        = list(string)
}

variable "name_seperator" {
  default     = "-"
  description = "Seperator to seperate names in name (default '-')"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Additional tags. Overwrite module-generated tags"
  type        = map(string)
}
