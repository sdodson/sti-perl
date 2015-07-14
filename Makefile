SKIP_SQUASH?=0
VERSIONS="5.16"

ifeq ($(TARGET),rhel7)
	OS := rhel7
else
	OS := centos7
endif

ifeq ($(VERSION), 5.16)
	VERSION := 5.16
else
	VERSION :=
endif

.PHONY: build
build:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) hack/build.sh $(OS) $(VERSION)

.PHONY: test
test:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) TEST_MODE=true hack/build.sh $(OS) $(VERSION)
