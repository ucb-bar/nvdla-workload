#!/bin/bash

# ARGS:
# $1 - the loadable
# $2..$n - the images

set -x

NVDLA_DIR=/root

cd ${NVDLA_DIR} || exit 1

export LD_LIBRARY_PATH=${PWD}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

LOADABLE=$1
shift

# Run through all of the supplied images.
while test $# -gt 0; do
    echo "Running '$1' through '$LOADABLE'"
    ./nvdla_runtime --loadable "$LOADABLE" --image "$1"
    if [[ -f output.dimg ]]; then
        mv output.dimg "$1.dimg"
    else
        echo "No output from '$1' detected!"
    fi
    shift
done

poweroff
