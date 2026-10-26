PDF_DOCUMENTS=hhg-docker.pdf osdp-testpoints-conops.pdf

all:	${PDF_DOCUMENTS}

clean:
	rm -f *.pdf

hhg-docker.pdf:	hhg-docker.md
	pandoc -o hhg-docker.pdf --toc hhg-docker.md

osdp-testpoints-conops.pdf:	osdp-testpoints-conops.md
	pandoc -o osdp-testpoints-conops.pdf --toc osdp-testpoints-conops.md

