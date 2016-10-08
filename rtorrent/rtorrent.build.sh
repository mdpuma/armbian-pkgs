#!/bin/bash

apt-get install build-essential libtool libcppunit-dev libcppunit-1.13-0 pkg-config libncurses5-dev libcurl4-openssl-dev libxmlrpc-c++8-dev

apt-get install ruby2.1 ruby2.1-dev
gem install fpm -v 1.4.0 -V

# clone & compile libtorrent
git clone https://github.com/rakshasa/libtorrent

cd libtorrent/
./autogen.sh
./configure
make -j2
mkdir installroot
DESTDIR=`pwd`/installroot make install

# build deb file
rm *.deb -v

fpm -s dir -t deb -C installroot --version "0.13.6" --iteration "1" -a "armhf" -e --description "" --url "https://github.com/rakshasa/libtorrent" --maintainer "pumamd@yandex.ru" --license "GPLv2" --name libtorrent

# clone & compile rtorrent
git clone https://github.com/rakshasa/rtorrent

cd rtorrent/
./autogen.sh 
./configure --with-xmlrpc-c=/usr/bin/xmlrpc-c-config
make -j2
mkdir installroot
DESTDIR=`pwd`/installroot make install

# build deb file
rm *.deb -v

fpm -s dir -t deb -C installroot --version "0.9.6" --iteration "1" -a "armhf" -e --description "" --url "https://github.com/rakshasa/rtorrent" --maintainer "pumamd@yandex.ru" --license "GPLv2" --name rtorrent
