#!/bin/bash
set +ue
set -x
DISK="/mnt/sdc1"
mkdir "${DISK}/planet_osm/"
PLANET_OSM_PATH="${DISK}/planet_osm/planet.osm.pbf"
PLANET_OSM_PATH_RU_PATH="${DISK}"
PLANET_OSM_PATH_RU="${PLANET_OSM_PATH_RU_PATH}/RU"
PRODUCTION_HOST="offlinemaps.cloudapp.net"
PRODUCTION_HOST_PATH="/mnt/sdc1/osrm"
