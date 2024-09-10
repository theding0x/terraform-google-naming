
output "unique-seed" {
  value = coalesce(var.unique-seed, local.random_safe_generation)
}

output "validation" {
  value = local.validation
}
output "compute_address" {
  value       = local.gcp.compute_address
  description = "Compute Address"
}

output "compute_attached_disk" {
  value       = local.gcp.compute_attached_disk
  description = "Compute Attached Disk"
}

output "compute_autoscaler" {
  value       = local.gcp.compute_autoscaler
  description = "Compute Autoscaler"
}

output "compute_backend_bucket" {
  value       = local.gcp.compute_backend_bucket
  description = "Compute Backend Bucket"
}

output "compute_backend_bucket_signed_url_key" {
  value       = local.gcp.compute_backend_bucket_signed_url_key
  description = "Compute Backend Bucket Signed Url Key"
}

output "compute_backend_iam" {
  value       = local.gcp.compute_backend_iam
  description = "Compute Backend Iam"
}

output "compute_backend_service" {
  value       = local.gcp.compute_backend_service
  description = "Compute Backend Service"
}

output "compute_backend_service_iam" {
  value       = local.gcp.compute_backend_service_iam
  description = "Compute Backend Service Iam"
}

output "compute_backend_service_signed_url_key" {
  value       = local.gcp.compute_backend_service_signed_url_key
  description = "Compute Backend Service Signed Url Key"
}

output "compute_ha_vpn_gateway" {
  value       = local.gcp.compute_ha_vpn_gateway
  description = "Compute Ha Vpn Gateway"
}

output "compute_network" {
  value       = local.gcp.compute_network
  description = "Compute Network"
}

output "compute_subnetwork" {
  value       = local.gcp.compute_subnetwork
  description = "Compute Subnetwork"
}

output "container_cluster" {
  value       = local.gcp.container_cluster
  description = "Container Cluster"
}


