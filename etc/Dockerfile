FROM ubuntu:26.10
WORKDIR /opt/osdp-conformance/run/PD
COPY . .
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2 openssh-server sudo vim-tiny
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN dpkg -i libosdp-conformance_amd64.deb
RUN chmod +x /opt/osdp-conformance/run/PD/up.osdp
RUN cp default-PD-parameters.json open-osdp-parameters.json
RUN mv /opt/osdp-conformance/run/PD/up.osdp /usr/local/bin
RUN ln -s /opt/osdp-conformance/bin/open-osdp /usr/local/bin/open-osdp 
RUN rm *deb
RUN mkdir -p /var/run/sshd
CMD ["/usr/local/bin/up.osdp"]

