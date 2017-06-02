#!/bin/bash

pushd .. > /dev/null

NOW=$(date +"%Y%m%d%H%M")

tar -czf backups/image_snapshots/albus_image_$NOW.tgz albus.image albus.changes

popd > /dev/null
