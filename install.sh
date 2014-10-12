#!/bin/bash
set +ue
set -x
echo "For Ubuntu 14.04+"
apt-get update
echo "1"
apt-get install git
git clone https://github.com/Project-OSRM/osrm-backend.git osrm-backend
touch /etc/sysctl.con
echo "kernel.shmall=1152921504606846720" >> /etc/sysctl.conf
echo "kernel.shmmax=18446744073709551615" >> /etc/sysctl.conf
sysctl -p
echo "vm.overcommit_ratio = 100" >> /etc/sysctl.conf
echo "vm.overcommit_memory = 2" >> /etc/sysctl.conf
sysctl -p
echo 2 > /proc/sys/vm/overcommit_memory
echo 100 > /proc/sys/vm/overcommit_ratio

echo "2"
apt-get -y install \
build-essential git cmake pkg-config libprotoc-dev libprotobuf8 \
protobuf-compiler libprotobuf-dev libosmpbf-dev libpng12-dev \
libbz2-dev libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev \
libzip-dev libboost-all-dev lua5.1 liblua5.1-0-dev \
libluabind-dev libluajit-5.1-dev libtbb-dev
echo "3"
cd osrm-backend
mkdir  build
cd build
cmake ..
make
cd ../..
pwd
