# Makefile for deploying the static Hugo site to the remote server
USER ?= ec2-user
HOST ?= rsync-aws.fft
DIR ?= /var/www/html/ipap.tech/htdocs
HUGO = hugo
RSYNC = rsync
RM = rm -rf

# COLORS
GREEN := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE := $(shell tput -Txterm setaf 7)
RESET := $(shell tput -Txterm sgr0)

.PHONY: deploy clean local remote-clean help
.DEFAULT_GOAL := deploy

deploy: ## Deploy the site to the remote server
	@$(HUGO)
	$(RSYNC) -avz --progress --delete public/* $(HOST):$(DIR)

clean: ## Clean the `public` directory
	@$(RM) public/*

local: ## Run the site locally
	@$(HUGO) server -D

remote-clean: ## Clean the remote server
	ssh $(USER)@$(HOST) "rm -rf $(DIR)/*"

help: ## Show help about targets of the Makefile
	@echo ''
	@echo 'Usage:'
	@echo '  $(YELLOW)make$(RESET) $(GREEN)<target>$(RESET)'
	@echo ''
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-16s$(RESET) %s\n", $$1, $$2}'
