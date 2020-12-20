#############################################################
#
# libshake2 0.3.2
#
#############################################################
LIBSHAKE2_VERSION = 7f643c8
LIBSHAKE2_SITE = $(call github,zear,libShake,$(LIBSHAKE2_VERSION))
LIBSHAKE2_LICENSE = MIT
LIBSHAKE2_LICENSE_FILES = LICENSE.txt
LIBSHAKE2_INSTALL_STAGING = YES

LIBSHAKE2_MAKE_ENV = CC="$(TARGET_CC)" PREFIX=/usr

define LIBSHAKE2_BUILD_CMDS
	$(LIBSHAKE2_MAKE_ENV) $(MAKE) -C $(@D) BACKEND=LINUX
endef

define LIBSHAKE2_INSTALL_STAGING_CMDS
	$(LIBSHAKE2_MAKE_ENV) DESTDIR="$(STAGING_DIR)" $(MAKE) -C $(@D) BACKEND=LINUX install
endef

define LIBSHAKE2_INSTALL_TARGET_CMDS
	$(LIBSHAKE2_MAKE_ENV) DESTDIR="$(TARGET_DIR)" $(MAKE) -C $(@D) BACKEND=LINUX install-lib
endef

$(eval $(generic-package))
