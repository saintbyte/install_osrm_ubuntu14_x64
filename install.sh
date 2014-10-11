#!/bin/bash
set +ue
set -x
echo "For Ubuntu 14.04+"
echo "1"
#apt-get install git
#git clone git@github.com:Project-OSRM/osrm-backend.git osrm-backend
echo "2"
apt-get -y install \
build-essential git cmake pkg-config libprotoc-dev libprotobuf8 \
protobuf-compiler libprotobuf-dev libosmpbf-dev libpng12-dev \
libbz2-dev libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev \
libzip-dev libboost-all-dev lua5.1 liblua5.1-0-dev \
libluabind-dev libluajit-5.1-dev libtbb-dev
echo "3"
cd osrm-backend
mkdir -p build
cd build
cmake ..
make
cd ../..
pwd