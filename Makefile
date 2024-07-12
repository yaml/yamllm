SHELL := bash

ROOT := $(shell pwd)
BIN := $(ROOT)/bin
TEST := $(ROOT)/test

YS_ROOT := $(ROOT)/ys
YS_BIN := $(YS_ROOT)/bin
YS := $(YS_BIN)/ys
YS_INSTALL_URL := https://yamlscript.org/install

export PATH := $(ROOT)/bin:$(PATH)
export YAMLLM_ROOT := $(ROOT)

test-file := $(TEST)/test1.yaml

repeat := 1


#------------------------------------------------------------------------------
default:

.PHONY: test
test: $(YS)
	@for i in {1..$(repeat)}; do \
	  ( set -x; YAMLLM_TEST_FILE=$(test-file) yamllm ); \
	done

install-ys: $(YS)

clean:

realclean: clean
	$(RM) -r log

distclean: realclean
	$(RM) -r $(YS_ROOT)

#------------------------------------------------------------------------------
$(YS):
	curl -s $(YS_INSTALL_URL) | PREFIX=$(YS_ROOT) BIN=1 bash
	$@ --version
	@echo $@ installed
