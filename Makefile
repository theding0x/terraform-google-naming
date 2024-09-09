.PHONY: install generate format validate build all

install:
	@export GO111MODULE=on
	@if ! command -v terraform &> /dev/null; then \
		go get github.com/hashicorp/terraform@v1.9.5; \
	fi
	@if ! command -v terraform-docs &> /dev/null; then \
        go install github.com/terraform-docs/terraform-docs@v0.18.0; \
	fi
	@if ! command -v tfsec &> /dev/null; then \
		go install github.com/aquasecurity/tfsec/cmd/tfsec@latest; \
	fi
	@if ! command -v tflint &> /dev/null; then \
		go install github.com/terraform-linters/tflint@v0.53.0; \
	fi

generate:
	@go run main.go

format:
	@terraform fmt

validate:
	@terraform fmt --check
	@terraform validate -no-color
	@tflint --no-color

build: install generate

all: build format validate