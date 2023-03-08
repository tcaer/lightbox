.PHONY: all run lbx sandbox

all: lbx sandbox

run: sandbox
	@echo "@@ Running Sandbox @@"
	cd sandbox && bin/sandbox

lbx:
	cd lbx && make

sandbox:
	cd sandbox && make

