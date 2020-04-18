#!/bin/bash

rm *.deb -v

DESC="small-footprint UNIX/Linux daemon to relay multicast UDP traffic to client's TCP (HTTP) connection."
fpm -s dir -t deb -C root --version "1.0-23.10" --iteration "2" -a "armhf" -e --description "$DESC" --url "http://sourceforge.net/projects/udpxy" --maintainer "pumamd@yandex.ru" --license "GPLv2" --name udpxy
