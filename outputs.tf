
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
