#!/bin/bash
set +ue
set -x
source ./vars.sh
OSRM_DIR="${DISK}/osrm_tmp/"
CORES=`nproc`
mkdir "${OSRM_DIR}"
#$PLANET_OSM_PATH
echo "move route"
cp ./osrm-backend/build/osrm-datastore  ${OSRM_DIR}
cp ./osrm-backend/build/osrm-extract ${OSRM_DIR}
cp ./osrm-backend/build/osrm-prepare ${OSRM_DIR}
cp ./osrm-backend/build/osrm-routed ${OSRM_DIR}
cp ./osrm-backend/profiles/car.lua ${OSRM_DIR}profile.lua

touch ${OSRM_DIR}.stxxl
echo "disk=${DISK}/osrm_tmp_file,156000,syscall" > ${OSRM_DIR}.stxxl
echo "Route make"
cd ${OSRM_DIR}
if [ ! -f "$PLANET_OSM_PATH_RU.osm" ] 
then
    nice -n -19 ${OSRM_DIR}osrm-extract -p ${OSRM_DIR}/profile.lua -t ${CORES} $PLANET_OSM_PATH_RU.osm 2>${OSRM_DIR}output 3>${OSRM_DIR}err
else
    echo "Have OSRM file =)"
fi
nice -n -19 ${OSRM_DIR}osrm-prepare $PLANET_OSM_PATH_RU.osrm