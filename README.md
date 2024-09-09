<!-- BEGIN_TF_DOCS -->
# Google Naming

This module helps you to keep consistency on your resources names for Terraform The goal of this module it is that for each resource that requires a name in Terraform you would be easily able to compose this name using this module and this will keep the consistency in your repositories.

# Usage

For every resource in `terraform_google` just remove the `google` part of the module and use the `name` property of this output.

example for `google_resource_group` you can use :

```tf
module "naming" {
  source  = "theding0x/naming/google"
  suffix = [ "test" ]
}
resource "google_container_cluster" "example" {
  name     = module.naming.container_cluster.name
  region = "uscentral1"
}
```

if you want this to be unique for this module and not shared with other instances of this module you can use `name_unique`

```tf
module "naming" {
  source  = "theding0x/naming/google"
  suffix = [ "test" ]
}
resource "google_container_cluster" "example" {
  name     = module.naming.container_cluster.name_unique
  region = "uscentral1"
}
```
Other advanced usages will be explained in the [Advanced usage](#advanced-usage) part of this docs.

# Internals

## Prerequisites and setup

- Install [tflint](https://github.com/terraform-linters/tflint) as suitable for your OS.

- Run `make install` in the root directory of the repo.

## Modifying resources

The resources are automatically generated using `go` to change the generation please change the file on the `templates` folder. To add a new resource, including its definition in the file `resourceDefinition.json`, and it will be automatically generated when `main.go` is run.

# Current implementation

You can find a list bellow of all the resources that are currently implemented. To get a list of the ones that are missing implementation you can check at [Missing resources](docs/missing\_resources.md) the resources that have no documentation about their limitation on naming currently on Microsoft docs are on the [Not defined](docs/not\_defined.md) list.

# Advanced usage

## Output

Each one of the resources emits the name of the resource and other properties:

| Property | Type | Description                                                             |
| ----- |----- |-------------------------------------------------------------------------|
| name | string | name of the resource including respective suffixes and prefixes applied |
| name\_unique | string | same as the name but with random chars added for uniqueness             |
| dashes | bool | if these resources support dashes                                       |
| slug | string | letters to identify this resource among others                          |
| min\_length | integer | Minimum length required for this resource name                          |
| max\_length | integer | Maximum length allowed for this resource name                           |
| scope | string | scope which this name needs to be unique, such as `project` or `global` |
| regex | string | Terraform compatible version of the regex                               |

### Example Output

Every resource will have an output with the following format:

```go
postgresql_server = {
      name        = "pre-fix-psql-su-fix"
      name_unique = "pre-fix-psql-su-fix-asdfg"
      dashes      = true
      slug        = "psql"
      min_length  = 3
      max_length  = 63
      scope       = "global"
      regex       = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.first_letter](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix to use for all resources | `list(string)` | `[]` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | The suffix to use for all resources | `list(string)` | `[]` | no |
| <a name="input_unique-include-numbers"></a> [unique-include-numbers](#input\_unique-include-numbers) | Whether to include numbers in the unique string | `bool` | `true` | no |
| <a name="input_unique-length"></a> [unique-length](#input\_unique-length) | The length of the unique string | `number` | `8` | no |
| <a name="input_unique-seed"></a> [unique-seed](#input\_unique-seed) | The seed to use for the unique string | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_unique-seed"></a> [unique-seed](#output\_unique-seed) | n/a |
| <a name="output_validation"></a> [validation](#output\_validation) | n/a |

# Contributing Guidelines

See [CONTRIBUTING.md](CONTRIBUTING.md) for information on how to contribute to this project.
<!-- END_TF_DOCS -->