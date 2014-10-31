FROM dockernano/buildroot:2014.08
MAINTAINER Christian Häusler <haeusler.christian@mac.com>

COPY	in/buildroot.conf	/root/buildroot/.config
COPY	in/*.patch		/root/buildroot/patches/
COPY	in/httpd		/root/buildroot/package/httpd

RUN	patch -p0 -d buildroot -i ~/buildroot/patches/*

