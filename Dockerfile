FROM dockernano/buildroot:2014.08
MAINTAINER Christian Häusler <haeusler.christian@mac.com>

COPY	in/buildroot.conf	/root/buildroot/.config
COPY	in/package/Config.in	/root/buildroot/package/Config.in
COPY	in/package/httpd	/root/buildroot/package/httpd

