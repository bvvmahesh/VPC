.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: prod nonprod
LOG=/tmp/terraform-make.log

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-10s\033[0m %s\n", $$1, $$2}'

prod: ## Apply Module in Prod Environement
	@cd nonprod
	@terraform init
	@terraform workspace new prod || terraform workspace select prod
	@terraform apply -auto-approve

nonprod: ## Apply Module in NonProd Environement
	@cd prod
	@terraform init
	@terraform workspace new nonprod || terraform workspace select nonprod
	@terraform apply -auto-approve