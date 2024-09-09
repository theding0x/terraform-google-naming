
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


