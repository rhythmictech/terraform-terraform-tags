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
| terraform | >= 0.12.19 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enforce\_case | Type casing to enforce. Options are: [ None (default) \| UPPER \| lower ] | `string` | `"None"` | no |
| name\_seperator | Seperator to seperate names in name (default '-') | `string` | `"-"` | no |
| names | Namespaces in descending level of specificity, eg ['marge', 'kubernetes', 'prod', 'eus1'] | `list(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| tags | Additional tags. Overwrite module-generated tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | Moniker to be applied to resources |
| name32 | first 32 chars of string name |
| name6 | first 6 chars of string name |
| namenosymbols | name with symbols removed |
| tags | Tags as a map (includes a `Name` tag) |
| tags\_as\_list\_of\_maps | Tags as a list of maps, to make things like tagging ECS simple (includes a `Name` tag) |
| tags\_no\_name | Tags as a map (excludes Name key) |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
