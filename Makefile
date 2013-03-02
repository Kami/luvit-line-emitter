test:
	-luvit -e '' || wget -qct3 https://github.com/luvit/luvit-releases/raw/master/0.6.0/ubuntu12.04/x86_64/luvit.tar.gz
	-luvit -e '' || tar -xzf luvit.tar.gz
	export PATH=$$PATH:luvit/bin ; modules/bourbon/bin/bourbon -p tests

.PHONY: test
