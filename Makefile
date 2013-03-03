PWD := $(shell pwd)
PATH := $(PWD)/luvit/bin:$(PATH)
LUVIT_VERSION ?= "0.6.0"

test:
	(luvit --version | grep $(LUVIT_VERSION) > /dev/null) || wget -qct3 https://github.com/luvit/luvit-releases/raw/master/$(LUVIT_VERSION)/ubuntu12.04/x86_64/luvit.tar.gz
	(luvit --version | grep $(LUVIT_VERSION) > /dev/null) || tar -xzf luvit.tar.gz
	luvit --version
	luvit $(PWD)/modules/bourbon/bin/bourbon -p $(PWD)/tests
	rm -rf luvit* 2> /dev/null

.PHONY: test
