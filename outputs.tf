
output "unique-seed" {
  value = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  value = local.validation
}
output "compute_ha_vpn_gateway" {
  value       = local.gcp.compute_ha_vpn_gateway
  description = "Compute Ha Vpn Gateway"
}

output "compute_network" {
  value       = local.gcp.compute_network
  description = "Compute Network"
}

output "container_cluster" {
  value       = local.gcp.container_cluster
  description = "Container Cluster"
}


