.PHONY: c clean \
	f format \
	h help \
	local \
	multiarch_image \
	publish \
	t test \
	wheel

h: help
c: clean
f: format
t: test

help:
	@echo "Options:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

HUB_USER=unixorn
PLATFORMS=linux/arm64,linux/amd64,linux/arm/v7
RESTIC_VERSION=0.18.0
DATE:=$(shell date -u +"%Y-%m-%d")

install_hooks: ## Install the git hooks
	poetry run pre-commit install

local: ## Makes a restic docker image for only the architecture we're running on. Does not push to dockerhub.
	docker buildx build --build-arg application_version=${RESTIIC_VERSION}  --load -t ${HUB_USER}/restic:${RESTIC_VERSION}-${DATE} -f Dockerfile .

multiarch: ## Makes a multi-architecture restic docker image. Pushes to dockerhub.
	docker buildx build --platform ${PLATFORMS} --build-arg application_version=${RESTIIC_VERSION} --pull --no-cache  --push -t ${HUB_USER}/restic:${RESTIC_VERSION}- -f Dockerfile .

latest: multiarch ## Pulls the latest version off of dockerhub to verify it was pushed correctly.
	docker buildx build --platform ${PLATFORMS} --build-arg application_version=${RESTIIC_VERSION} --pull --push -t ${HUB_USER}/restic:latest -f Dockerfile .

	docker pull ${HUB_USER}/restic:latest

publish: multiarch latest ## Makes a multi-architecture restic docker image and pushes it to dockerhub tagged as latest.
