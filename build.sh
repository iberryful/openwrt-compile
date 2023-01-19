#!/bin/bash -e

VER=21.02.5

# download sdk
wget https://downloads.openwrt.org/releases/$VER/targets/x86/64/openwrt-sdk-$VER-x86-64_gcc-8.4.0_musl.Linux-x86_64.tar.xz -O openwrt.tar.xz

#wget https://github.com/openwrt/openwrt/archive/refs/tags/v21.02.5.tar.gz -O openwrt.tar.gz

tar -xf openwrt.tar.*
mv openwrt-* openwrt


./add-packages.sh

cd openwrt
sed -i '/CONFIG_TARGET_ROOTFS_PARTSIZE/ c\CONFIG_TARGET_ROOTFS_PARTSIZE=1024' .config
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config


#./scripts/feeds update -a
#./scripts/feeds install -a

all_packages="luci luci-compat -dnsmasq dnsmasq-full luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn"

all_packages="$all_packages \
wget curl vim-full bash\
luci-app-openclash \
"

make image PACKAGES="$all_packages" FILES="files"


