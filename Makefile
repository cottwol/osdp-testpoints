OSDP_CONTAINERS=osdp-acu.tar osdp-pd.tar
VERSION=0.02

all:	${OSDP_CONTAINERS}

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
	sudo chmod +r *tar
	tar czvf osdp-testpoints_${VERSION}.tgz *tar
	ls -l *tar

