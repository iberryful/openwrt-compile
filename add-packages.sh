#!/bin/bash -e

cd openwrt

PKG_DIR=package/addon
mkdir -p $PKG_DIR

cp -r ../custom-packages package/



svn export --force https://github.com/coolsnowwolf/lede/branches/master/package/lean/autocore $PKG_DIR/autocore 
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git $PKG_DIR/luci-app-adguardhome
svn export --force https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash $PKG_DIR/luci-app-openclash
git clone https://github.com/tty228/luci-app-serverchan.git $PKG_DIR/luci-app-serverchan
#svn export --force https://github.com/coolsnowwolf/lede/branches/master/package/lean/r8125 $PKG_DIR/r8125


git clone https://github.com/fw876/helloworld.git $PKG_DIR/helloworld
cp -r $PKG_DIR/helloworld/* $PKG_DIR
rm -rf $PKG_DIR/helloworld



mkdir -p files
cd files
mkdir -p usr/lib/geosite
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -O usr/lib/geosite/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -O usr/lib/geosite/geosite.dat

mkdir -p usr/bin
wget https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_darwin_amd64 -O usr/bin/nexttrace
chmod +x usr/bin/nexttrace

wget https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz -O /tmp/speedtest.tgz
tar -zxf /tmp/speedtest.tgz -C usr/bin/
chmod +x usr/bin/speedtest
rm usr/bin/speedtest.*

cd ..
cd ..