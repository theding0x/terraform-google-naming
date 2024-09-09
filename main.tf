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
    compute_network = {
      valid_name        = length(regexall(local.gcp.compute_network.regex, local.gcp.compute_network.name)) > 0 && length(local.gcp.compute_network.name) > local.gcp.compute_network.min_length
      valid_name_unique = length(regexall(local.gcp.compute_network.regex, local.gcp.compute_network.name_unique)) > 0
    }
    container_cluster = {
      valid_name        = length(regexall(local.gcp.container_cluster.regex, local.gcp.container_cluster.name)) > 0 && length(local.gcp.container_cluster.name) > local.gcp.container_cluster.min_length
      valid_name_unique = length(regexall(local.gcp.container_cluster.regex, local.gcp.container_cluster.name_unique)) > 0
    }
  }
}
