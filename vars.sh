#!/bin/bash
set +ue
set -x
DISK="/mnt/sdc1"
mkdir "${DISK}/planet_osm/"
PLANET_OSM_PATH="${DISK}/planet_osm/planet.osm.pbf"
