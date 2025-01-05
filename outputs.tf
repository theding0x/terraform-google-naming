
output "unique-seed" {
  value = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  value = local.validation
}
output "container_cluster" {
  value       = local.gcp.container_cluster
  description = "Container Cluster"
}

output "container_node_pool" {
  value       = local.gcp.container_node_pool
  description = "Container Node Pool"
}


