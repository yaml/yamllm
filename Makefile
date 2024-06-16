SHELL := bash

ROOT := $(shell pwd)
BIN := $(ROOT)/bin
TEST := $(ROOT)/test

YS := $(BIN)/ys
YS_INSTALL_URL := https://yamlscript.org/install

export PATH := $(ROOT)/bin:$(PATH)
export YAMLLM_ROOT := $(ROOT)

test-file := $(TEST)/test1.yaml


#------------------------------------------------------------------------------
default:

.PHONY: test
test: $(YS)
	YAMLLM_TEST_FILE=$(test-file) yamllm

install-ys: $(YS)

clean:

realclean: clean

distclean: realclean
	$(RM) $(YS)*

#------------------------------------------------------------------------------
$(YS):
	curl -s $(YS_INSTALL_URL) | PREFIX=$(ROOT) BIN=1 bash
	$@ --version
	@echo $@ installed
