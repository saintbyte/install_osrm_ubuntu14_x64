#!/bin/bash
set +ue
set -x
source ./vars.sh
rm -f $PLANET_OSM_PATH
wget -O"$PLANET_OSM_PATH" http://planet.openstreetmap.org/pbf/planet-latest.osm.pbf