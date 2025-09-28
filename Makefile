PKG := haproxy
SPECFILE := SPECS/$(PKG).spec

VER_MINOR := $(shell cat VERSION-MINOR)
VER_PATCH := $(shell cat VERSION-PATCH)
VER_DIST := $(shell cat VERSION-DIST)

RPMBUILD_DEF := --define "VER_MINOR $(VER_MINOR)" \
                --define "VER_PATCH $(VER_PATCH)" \
                --define "VER_DIST $(VER_DIST)"

.PHONY: all download build clean

all: build

download:
	spectool -g -R $(RPMBUILD_DEF) $(SPECFILE)

build: download
	rpmbuild -ba $(RPMBUILD_DEF) $(SPECFILE)

clean:
	rm -rf ~/rpmbuild/BUILD/* ~/rpmbuild/BUILDROOT/*
