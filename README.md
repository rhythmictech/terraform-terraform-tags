# terraform-terraform-tags
[![](https://github.com/rhythmictech/terraform-terraform-tags/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-terraform-tags/actions)

Tag the world

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enforce\_case | Type casing to enforce. Options are: [ None (default) | UPPER | lower ] | string | `"None"` | no |
| name\_seperator | Seperator to seperate names in name (default '-') | string | `"-"` | no |
| names | Namespaces in descending level of specificity, eg ['marge', 'kubernetes', 'prod', 'eus1'] | list(string) | `[ "default" ]` | no |
| tags | Additional tags. Overwrite module-generated tags | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| name |  |
| name32 | first 32 chars of string name |
| name6 | first 6 chars of string name |
| namenosymbols | name with symbols removed |
| tags | Tags as a map |
| tags\_as\_list\_of\_maps | Tags as a list of maps, to make things like tagging ECS simple |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
