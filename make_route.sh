#!/bin/bash
set +ue
set -x
source ./vars.sh
OSRM_DIR="${DISK}/osrm_tmp/"
mkdir "${OSRM_DIR}"
#$PLANET_OSM_PATH
echo "move route"
cp ./osrm-backend/build/osrm-datastore  ${OSRM_DIR}
cp ./osrm-backend/build/osrm-extract ${OSRM_DIR}
cp ./osrm-backend/build/osrm-prepare ${OSRM_DIR}
cp ./osrm-backend/build/osrm-routed ${OSRM_DIR}
cp ./osrm-backend/profiles/car.lua ${OSRM_DIR}/profile.lua
echo "Route make"
cd ${OSRM_DIR}
nice -n -10 ${OSRM_DIR}osrm-extract -p ${OSRM_DIR}/profile.lua -t 2 $PLANET_OSM_PATH