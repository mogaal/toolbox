
NS ?= mogaal
VERSION ?= latest
IMAGE_NAME ?= toolbox

.PHONY: build push

build: Dockerfile
	docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) .

push:
	docker push $(NS)/$(IMAGE_NAME):$(VERSION)
    
default: build