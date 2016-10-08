#!/bin/bash

ITERATION="2"
VERSION="3.8"

yum install libconfuse-devel libnl3-devel -y

git clone https://github.com/tgraf/bmon.git
cd bmon

mkdir install -p

./autogen.sh
./configure --prefix=/usr
make
make DESTDIR=`pwd`/install install
fpm -s dir -t rpm -C `pwd`/install --vendor "AMPLICA" --iteration ${ITERATION}.el6 -d libconfuse -d libnl3 -a x86_64 -m admin@amplica.md -e --url http://amplica.md --version ${VERSION} --name bmon .
