#!/bin/bash

rm *.deb
fpm -t deb -s dir -C ../install-destination -n addrwatch -v 0.8 -d libevent-2.0-5 -d libpcap0.8 -e
