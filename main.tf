terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.3.2"
    }
  }
}

resource "random_string" "main" {
  length  = 60
  special = false
  upper   = false
  numeric = var.unique-include-numbers
}

resource "random_string" "first_letter" {
  length  = 1
  special = false
  upper   = false
  numeric = false
}



locals {
  // adding a first letter to guarantee that you always start with a letter
  random_safe_generation = join("", [random_string.first_letter.result, random_string.main.result])
  random                 = substr(coalesce(var.unique-seed, local.random_safe_generation), 0, var.unique-length)
  prefix                 = join("-", var.prefix)
  prefix_safe            = lower(join("", var.prefix))
  suffix                 = join("-", var.suffix)
  suffix_unique          = join("-", concat(var.suffix, [local.random]))
  suffix_safe            = lower(join("", var.suffix))
  suffix_unique_safe     = lower(join("", concat(var.suffix, [local.random])))
  // Names based in the recomendations of
  // https://cloud.google.com/compute/docs/naming-resources
  gcp = {
    compute_address = {
      name        = substr(join("-", compact([local.prefix, "address", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "address", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "address"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_attached_disk = {
      name        = substr(join("-", compact([local.prefix, "disk", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "disk", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "disk"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_autoscaler = {
      name        = substr(join("-", compact([local.prefix, "autoscaler", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "autoscaler", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "autoscaler"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_backend_bucket = {
      name        = substr(join("-", compact([local.prefix, "bucket", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "bucket", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "bucket"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_backend_bucket_signed_url_key = {
      name        = substr(join("-", compact([local.prefix, "key", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "key", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "key"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_backend_iam = {
      name        = substr(join("-", compact([local.prefix, "iam", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "iam", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "iam"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_backend_service = {
      name        = substr(join("-", compact([local.prefix, "service", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "service", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "service"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_backend_service_iam = {
      name        = substr(join("-", compact([local.prefix, "iam", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "iam", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "iam"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_backend_service_signed_url_key = {
      name        = substr(join("-", compact([local.prefix, "key", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "key", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "key"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_ha_vpn_gateway = {
      name        = substr(join("-", compact([local.prefix, "vpn", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "vpn", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "vpn"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_network = {
      name        = substr(join("-", compact([local.prefix, "vpc", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "vpc", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "vpc"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    compute_subnetwork = {
      name        = substr(join("-", compact([local.prefix, "subnet", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "subnet", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "subnet"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
    container_cluster = {
      name        = substr(join("-", compact([local.prefix, "gke", local.suffix])), 0, 50)
      name_unique = substr(join("-", compact([local.prefix, "gke", local.suffix_unique])), 0, 50)
      dashes      = true
      slug        = "gke"
      min_length  = 1
      max_length  = 50
      scope       = "project"
      regex       = "^[a-z]([-a-z0-9]*[a-z0-9])?$"
    }
  }
  validation = {
    compute_address = {
      valid_name        = length(regexall(local.gcp.compute_address.regex, local.gcp.compute_address.name)) > 0 && length(local.gcp.compute_address.name) > local.gcp.compute_address.min_length
      valid_name_unique = length(regexall(local.gcp.compute_address.regex, local.gcp.compute_address.name_unique)) > 0
    }
    compute_attached_disk = {
      valid_name        = length(regexall(local.gcp.compute_attached_disk.regex, local.gcp.compute_attached_disk.name)) > 0 && length(local.gcp.compute_attached_disk.name) > local.gcp.compute_attached_disk.min_length
      valid_name_unique = length(regexall(local.gcp.compute_attached_disk.regex, local.gcp.compute_attached_disk.name_unique)) > 0
    }
    compute_autoscaler = {
      valid_name        = length(regexall(local.gcp.compute_autoscaler.regex, local.gcp.compute_autoscaler.name)) > 0 && length(local.gcp.compute_autoscaler.name) > local.gcp.compute_autoscaler.min_length
      valid_name_unique = length(regexall(local.gcp.compute_autoscaler.regex, local.gcp.compute_autoscaler.name_unique)) > 0
    }
    compute_backend_bucket = {
      valid_name        = length(regexall(local.gcp.compute_backend_bucket.regex, local.gcp.compute_backend_bucket.name)) > 0 && length(local.gcp.compute_backend_bucket.name) > local.gcp.compute_backend_bucket.min_length
      valid_name_unique = length(regexall(local.gcp.compute_backend_bucket.regex, local.gcp.compute_backend_bucket.name_unique)) > 0
    }
    compute_backend_bucket_signed_url_key = {
      valid_name        = length(regexall(local.gcp.compute_backend_bucket_signed_url_key.regex, local.gcp.compute_backend_bucket_signed_url_key.name)) > 0 && length(local.gcp.compute_backend_bucket_signed_url_key.name) > local.gcp.compute_backend_bucket_signed_url_key.min_length
      valid_name_unique = length(regexall(local.gcp.compute_backend_bucket_signed_url_key.regex, local.gcp.compute_backend_bucket_signed_url_key.name_unique)) > 0
    }
    compute_backend_iam = {
      valid_name        = length(regexall(local.gcp.compute_backend_iam.regex, local.gcp.compute_backend_iam.name)) > 0 && length(local.gcp.compute_backend_iam.name) > local.gcp.compute_backend_iam.min_length
      valid_name_unique = length(regexall(local.gcp.compute_backend_iam.regex, local.gcp.compute_backend_iam.name_unique)) > 0
    }
    compute_backend_service = {
      valid_name        = length(regexall(local.gcp.compute_backend_service.regex, local.gcp.compute_backend_service.name)) > 0 && length(local.gcp.compute_backend_service.name) > local.gcp.compute_backend_service.min_length
      valid_name_unique = length(regexall(local.gcp.compute_backend_service.regex, local.gcp.compute_backend_service.name_unique)) > 0
    }
    compute_backend_service_iam = {
      valid_name        = length(regexall(local.gcp.compute_backend_service_iam.regex, local.gcp.compute_backend_service_iam.name)) > 0 && length(local.gcp.compute_backend_service_iam.name) > local.gcp.compute_backend_service_iam.min_length
      valid_name_unique = length(regexall(local.gcp.compute_backend_service_iam.regex, local.gcp.compute_backend_service_iam.name_unique)) > 0
    }
    compute_backend_service_signed_url_key = {
      valid_name        = length(regexall(local.gcp.compute_backend_service_signed_url_key.regex, local.gcp.compute_backend_service_signed_url_key.name)) > 0 && length(local.gcp.compute_backend_service_signed_url_key.name) > local.gcp.compute_backend_service_signed_url_key.min_length
      valid_name_unique = length(regexall(local.gcp.compute_backend_service_signed_url_key.regex, local.gcp.compute_backend_service_signed_url_key.name_unique)) > 0
    }
    compute_ha_vpn_gateway = {
      valid_name        = length(regexall(local.gcp.compute_ha_vpn_gateway.regex, local.gcp.compute_ha_vpn_gateway.name)) > 0 && length(local.gcp.compute_ha_vpn_gateway.name) > local.gcp.compute_ha_vpn_gateway.min_length
      valid_name_unique = length(regexall(local.gcp.compute_ha_vpn_gateway.regex, local.gcp.compute_ha_vpn_gateway.name_unique)) > 0
    }
    compute_network = {
      valid_name        = length(regexall(local.gcp.compute_network.regex, local.gcp.compute_network.name)) > 0 && length(local.gcp.compute_network.name) > local.gcp.compute_network.min_length
      valid_name_unique = length(regexall(local.gcp.compute_network.regex, local.gcp.compute_network.name_unique)) > 0
    }
    compute_subnetwork = {
      valid_name        = length(regexall(local.gcp.compute_subnetwork.regex, local.gcp.compute_subnetwork.name)) > 0 && length(local.gcp.compute_subnetwork.name) > local.gcp.compute_subnetwork.min_length
      valid_name_unique = length(regexall(local.gcp.compute_subnetwork.regex, local.gcp.compute_subnetwork.name_unique)) > 0
    }
    container_cluster = {
      valid_name        = length(regexall(local.gcp.container_cluster.regex, local.gcp.container_cluster.name)) > 0 && length(local.gcp.container_cluster.name) > local.gcp.container_cluster.min_length
      valid_name_unique = length(regexall(local.gcp.container_cluster.regex, local.gcp.container_cluster.name_unique)) > 0
    }
  }
}
