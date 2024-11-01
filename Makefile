REGISTRY_OWNER:=fazenda
PROJECT_TAG:=latest
PROJECT:=modelio

all: build

build:
	@docker buildx build --load --tag ${REGISTRY_OWNER}/${PROJECT}:${PROJECT_TAG} .

interact: build
	@docker run \
		--rm \
		--workdir /usr/src \
		-it \
		${REGISTRY_OWNER}/${PROJECT}:${PROJECT_TAG} \
		/bin/sh

publish:
	@docker buildx build --push --tag ${REGISTRY_OWNER}/${PROJECT}:${PROJECT_TAG} .
