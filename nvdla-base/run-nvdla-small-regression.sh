#!/bin/bash

set -x

NVDLA_DIR=/root

cd ${NVDLA_DIR}

export LD_LIBRARY_PATH=${PWD}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

./nvdla_runtime --loadable flatbufs/kmd/CONV/CONV_D_L0_0_small_fbuf
./nvdla_runtime --loadable flatbufs/kmd/SDP/SDP_X1_L0_0_small_fbuf
./nvdla_runtime --loadable flatbufs/kmd/CDP/CDP_L0_0_small_fbuf
./nvdla_runtime --loadable flatbufs/kmd/PDP/PDP_L0_0_small_fbuf
./nvdla_runtime --loadable flatbufs/kmd/NN/NN_L0_1_small_fbuf

poweroff
