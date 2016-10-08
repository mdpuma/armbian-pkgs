#!/bin/bash

rm *.deb -v
DESC="IGMPproxy is a simple dynamic Multicast Routing Daemon using only IGMP signalling. It's intended for simple forwarding of Multicast traffic between networks."
fpm -s dir -t deb -C root --version "0.1" --iteration "2" -a "armhf" -e --description "$DESC" --url "http://sourceforge.net/projects/igmpproxy" --maintainer "pumamd@yandex.ru" --license "GPLv2" --name igmpproxy
