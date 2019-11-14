
module "tags" {
  source = "../../"

  names = [
    "prod",
    "tags",
    "sblack4"
  ]
}


output "module_tags" {
  value = module.tags
}
