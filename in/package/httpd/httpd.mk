#############################################################
#
# httpd
#
#############################################################
HTTPD_VERSION         = 2.4.10
HTTPD_SITE            = http://archive.apache.org/dist/httpd/
HTTPD_SOURCE          = httpd-$(HTTPD_VERSION).tar.bz2
HTTPD_DEPENDENCIES    = apr-util pcre
HTTPD_LICENSE         = Apache-2.0
HTTPD_LICENSE_FILES   = LICENSE
# Needed for mod_php
HTTPD_INSTALL_STAGING = YES
# We have a patch touching configure.in and Makefile.in,
# so we need to autoreconf:
HTTPD_AUTORECONF      = YES

HTTPD_CONF_ENV += \
	CC_FOR_BUILD="$(HOSTCC)" \
	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
	ap_cv_void_ptr_lt_long=no \
	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config

HTTPD_CONF_OPT += \
	--sysconfdir=/etc/apache2 \
	--enable-module=all \
	--enable-so \
	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config

ifeq ($(BR2_ARCH_HAS_ATOMICS),y)
HTTPD_CONF_OPTS += --enable-nonportable-atomics=yes
endif

define HTTPD_FIX_STAGING_HTTPD_CONFIG
	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
endef
HTTPD_POST_INSTALL_STAGING_HOOKS += HTTPD_FIX_STAGING_HTTPD_CONFIG

$(eval $(autotools-package))
