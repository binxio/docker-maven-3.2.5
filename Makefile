.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build image
	docker build -t maven:3.2.5 .

init: ## create gcp source repo
	gcloud source repos create docker-maven-3.2.5 

add-remote: ## add remote
	git remote add origin $$(gcloud source repos describe docker-maven-3.2.5 --format="json" | jq -r '.url')
