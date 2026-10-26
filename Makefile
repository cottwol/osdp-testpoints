all:	build-image etc/Dockerfile etc/up.osdp

build-image:	collect-packages
	(cd build; ../bin/1-build-docker-image)

collect-packages:	build/libosdp-conformance.deb

build/libosdp-conformance.deb:	build
	cp ext-packages/libosdp-conformance_*_amd64.deb build/libosdp-conformance_amd64.deb

build:
	mkdir -p build
	cp etc/up.osdp build
	cp etc/default-PD-parameters.json build

clean:
	rm -rvf build *tar

package:	all
	(cd build; ../bin/4-save-docker)
	ls -l *tar

