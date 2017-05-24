REPO=blacktop
NAME=yara
BUILD ?= 3.6
LATEST ?= 3.6

all: build size test

build:
	cd $(BUILD); docker build -t $(REPO)/$(NAME):$(BUILD) .

size: build
ifeq "$(BUILD)" "$(LATEST)"
	sed -i.bu 's/docker%20image-.*-blue/docker%20image-$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD)| cut -d' ' -f1)%20MB-blue/' README.md
	sed -i.bu '/latest/ s/[0-9.]\{3,5\} MB/$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))/' README.md
endif
	sed -i.bu '/$(BUILD)/ s/[0-9.]\{3,5\} MB/$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))/' README.md

tags:
	docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $(REPO)/$(NAME)

test:
	docker run --rm $(REPO)/$(NAME):$(BUILD) /rules/test_rule /rules/test_rule

.PHONY: build size tags test
