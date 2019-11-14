
module "tags" {
  source = "../../"
}


output "module_tags" {
  value = module.tags
}
