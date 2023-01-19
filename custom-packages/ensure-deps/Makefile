include $(TOPDIR)/rules.mk

PKG_NAME:=ensure-deps
PKG_VERSION:=1.0.0
PKG_RELEASE:=$(AUTORELEASE)

SOURCE_DIR:=./

include $(INCLUDE_DIR)/package.mk


# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
define Build/Prepare
endef

# Package build instructions; invoke the target-specific compiler to first compile the source file, and then to link the file into the final executable
define Build/Compile
endef

define Package/ensure-deps/install
endef

define Package/ensure-deps
  DEPENDS:=+iperf3 +tcpdump +openssh-sftp-server +tailscaled +tailscale dnsmasq-full \
            +python3 +python3-pip +vim-full +mwan3 +zsh \
            +luci-app-serverchan +luci-app-openclash +luci-app-adguardhome \
            +luci-app-ssr-plus +luci-theme-material
  TITLE:=Ensure deps
  URL:=http://openwrt.org/
  VERSION:=$(PKG_VERSION)-$(PKG_RELEASE)
endef

define Package/ensure-deps/description
  Ensure deps
endef

$(eval $(call BuildPackage,ensure-deps))