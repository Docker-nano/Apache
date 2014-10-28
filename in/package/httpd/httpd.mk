#############################################################
#
# httpd
#
#############################################################
HTTPD_VERSION         = 2.4.9
HTTPD_SITE            = http://archive.apache.org/dist/httpd/
HTTPD_SOURCE          = httpd-$(HTTPD_VERSION).tar.bz2
HTTPD_DEPENDENCIES    = apr-util pcre

HTTPD_CONF_ENV += \
        ac_cv_file__dev_zero=yes \
        ac_cv_func_setpgrp_void=yes \
        apr_cv_tcp_nodelay_with_cork=yes \
        ac_cv_sizeof_struct_iovec=8 \
        apr_cv_process_shared_works=yes \
        apr_cv_mutex_robust_shared=no \
        ac_cv_struct_rlimit=yes \
        ap_cv_void_ptr_lt_long=no \
        CC="$(TARGET_CC)" \
        CFLAGS="$(TARGET_CFLAGS)" \
        LDFLAGS="$(TARGET_LDFLAGS)" \

HTTPD_CONF_OPT += \
	--host=$(GNU_TARGET_NAME) \
        --enable-so \
        --enable-module=all \
	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config

#define HTTPD_CONFIGURE_CMDS
#        (cd $(@D) && rm -rf config.cache; \
#                $(HTTPD_CONF_ENV) \
#                ./configure \
#                $(HTTPD_CONF_OPT) \
#        )
#endef

$(eval $(autotools-package))

