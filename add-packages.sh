#!/bin/bash



PKG_DIR=package/addon
mkdir -p $PKG_DIR

cp -r ../custom-packages package/

svn export https://github.com/QiuSimons/openwrt-mos/trunk/mosdns $PKG_DIR/mosdns
svn export https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns $PKG_DIR/luci-app-mosdns
svn export https://github.com/QiuSimons/openwrt-mos/trunk/v2ray-geodata $PKG_DIR/v2ray-geodata

git clone -b master --depth 1 https://github.com/tty228/luci-app-serverchan.git $PKG_DIR/luci-app-serverchan
git clone https://github.com/fw876/helloworld.git $PKG_DIR/helloworld

git clone https://github.com/rufengsuixing/luci-app-adguardhome.git $PKG_DIR/luci-app-adguardhome
svn export https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash $PKG_DIR/luci-app-openclash


mkdir -p files
cd files
mkdir -p usr/lib/geosite
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat usr/lib/geosite/
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat usr/lib/geosite/

mkdir -p usr/bin
wget https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_darwin_amd64 usr/bin/nexttrace
chmod +x usr/bin/nexttrace

wget https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz /tmp/speedtest.tgz
tar -zxf /tmp/speedtest.tgz -C usr/bin/
chmod +x usr/bin/speedtest

cd ..