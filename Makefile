OSDP_CONTAINERS=osdp-acu.tar osdp-pd.tar
VERSION=0.02

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
	rm -rvf build *tar build_osdp-acu build_osdp-pd

osdp-acu.tar:	etc/osdp-acu/Dockerfile
	mkdir -p build_osdp-acu
	cp ext-packages/libosdp-conformance_*_amd64.deb build_osdp-acu/libosdp-conformance_amd64.deb
	cp etc/osdp-acu/up.osdp build_osdp-acu
	cp etc/osdp-acu/default-ACU-parameters.json build_osdp-acu
	(cd build_osdp-acu; ../bin/102-build-acu)

osdp-pd.tar:	etc/osdp-pd/Dockerfile
	mkdir -p build_osdp-pd
	cp ext-packages/libosdp-conformance_*_amd64.deb build_osdp-pd/libosdp-conformance_amd64.deb
	cp etc/osdp-pd/up.osdp build_osdp-pd
	cp etc/osdp-pd/default-PD-parameters.json build_osdp-pd
	(cd build_osdp-pd; ../bin/101-build-pd)

package:	all ${OSDP_CONTAINERS}
	bin/4-save-docker
	tar czvf osdp-testpoints_${VERSION}.tgz *tar
	ls -l *tar

