.PHONY: install generate format validate build all

install:
	@export GO111MODULE=on
	@if ! command -v terraform &> /dev/null; then \
		go get github.com/hashicorp/terraform@v0.12.26; \
	fi
	@if ! command -v terraform-docs &> /dev/null; then \
		go get github.com/segmentio/terraform-docs@v0.9.1; \
	fi
	@if ! command -v tfsec &> /dev/null; then \
		go get github.com/liamg/tfsec/cmd/tfsec@v0.21.0; \
	fi
	@if ! command -v tflint &> /dev/null; then \
		go get github.com/terraform-linters/tflint@v0.16.2; \
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