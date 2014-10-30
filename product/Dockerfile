FROM scratch
MAINTAINER Christian Häusler <haeusler.christian@mac.com>

ADD	rootfs.tar.xz	/
COPY	httpd.conf	/etc/apache2/httpd.conf

EXPOSE	80

CMD	["httpd", "-DFOREGROUND"]

