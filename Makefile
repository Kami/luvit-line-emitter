test:
	-luvit -e '' || wget -qct3 https://github.com/luvit/luvit-releases/raw/master/0.6.0/ubuntu12.04/x86_64/luvit.tar.gz
	-luvit -e '' || tar -xzvf luvit.tar.gz
	PATH=$$PATH:luvit/bin modules/bourbon/bin/bourbon -p tests

.PHONY: test
