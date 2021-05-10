# terraform-terraform-tags
[![](https://github.com/rhythmictech/terraform-terraform-tags/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/terraform-terraform-tags/actions)  <a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=RhythmicTech" alt="follow on Twitter"></a>

A handy dandy module to ensure consistent tagging policies across your Terraform world.

Example:

```hcl
module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "1.0.0"

  names = ["example", "prod", "frontend"]

  tags = {
    "Env"       = "prod",
    "Namespace" = "frontend",
    "Owner"     = "Frontend Engineering Team"
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.19 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enforce_case"></a> [enforce\_case](#input\_enforce\_case) | Type casing to enforce. Options are: [ None (default) \| UPPER \| lower ] | `string` | `"None"` | no |
| <a name="input_name_seperator"></a> [name\_seperator](#input\_name\_seperator) | Seperator to seperate names in name (default '-') | `string` | `"-"` | no |
| <a name="input_names"></a> [names](#input\_names) | Namespaces in descending level of specificity, eg ['marge', 'kubernetes', 'prod', 'eus1'] | `list(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags. Overwrite module-generated tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Moniker to be applied to resources |
| <a name="output_name32"></a> [name32](#output\_name32) | first 32 chars of string name |
| <a name="output_name6"></a> [name6](#output\_name6) | first 6 chars of string name |
| <a name="output_namenosymbols"></a> [namenosymbols](#output\_namenosymbols) | name with symbols removed |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags as a map (includes a `Name` tag) |
| <a name="output_tags_as_list_of_maps"></a> [tags\_as\_list\_of\_maps](#output\_tags\_as\_list\_of\_maps) | Tags as a list of maps, to make things like tagging ECS simple (includes a `Name` tag) |
| <a name="output_tags_no_name"></a> [tags\_no\_name](#output\_tags\_no\_name) | Tags as a map (excludes Name key) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
