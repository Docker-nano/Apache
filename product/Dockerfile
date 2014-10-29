FROM scratch
MAINTAINER Christian Häusler <haeusler.christian@mac.com>

ADD	rootfs.tar.xz	/
ADD	httpd.conf /etc/apache2/httpd.conf

VOLUME	["/usr/htdocs", "/etc/apache2]

EXPOSE	80

CMD	["httpd", "-DFOREGROUND"]

