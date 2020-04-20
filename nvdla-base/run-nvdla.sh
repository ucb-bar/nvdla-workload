#!/bin/bash

# ARGS:
# $1 - the loadable
# $2 - the image

set -ex

NVDLA_DIR=/root

cd ${NVDLA_DIR}

export LD_LIBRARY_PATH=${PWD}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

./nvdla_runtime --loadable $1 --image $2

poweroff
