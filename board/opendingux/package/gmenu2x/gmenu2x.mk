################################################################################
#
# gmenu2x
#
################################################################################
GMENU2X_VERSION = master
GMENU2X_SITE = $(call github,Ninoh-FOX,gmenu2x,$(GMENU2X_VERSION))
GMENU2X_DEPENDENCIES = sdl sdl_ttf sdl_gfx dejavu libpng fonts-droid
GMENU2X_AUTORECONF = YES
GMENU2X_CONF_OPTS = \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--enable-platform=$(BR2_PACKAGE_GMENU2X_PLATFORM) \
	--enable-stick=$(BR2_PACKAGE_GMENU2X_STICK) \
	--enable-battery=$(BR2_PACKAGE_GMENU2X_BATTERY)

#ifeq ($(BR2_PACKAGE_GMENU2X_SHOW_CLOCK),y)
#GMENU2X_CONF_OPTS += -DCLOCK=ON
#else
#GMENU2X_CONF_OPTS += -DCLOCK=OFF
#endif

#ifeq ($(BR2_PACKAGE_GMENU2X_CPUFREQ),y)
#GMENU2X_CONF_OPTS += -DCPUFREQ=ON
#else
#GMENU2X_CONF_OPTS += -DCPUFREQ=OFF
#endif

ifeq ($(BR2_PACKAGE_LIBOPK),y)
GMENU2X_DEPENDENCIES += libopk
endif

ifeq ($(BR2_PACKAGE_LIBXDGMIME),y)
GMENU2X_DEPENDENCIES += libxdgmime
endif

$(eval $(autotools-package))