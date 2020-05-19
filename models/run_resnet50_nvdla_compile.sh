#!/bin/bash

NVDLA_WORKLOAD_DIR=$PWD/..
OUTPUT_DIR=$NVDLA_WORKLOAD_DIR/models
COMPILER_PATH=$NVDLA_WORKLOAD_DIR/nvdla-base/nvdla-sw/umd/out/apps/compiler/nvdla_compiler

UMD_TOP=$NVDLA_WORKLOAD_DIR/nvdla-base/nvdla-sw/umd
make -C $UMD_TOP compiler TOP=$UMD_TOP

export LD_LIBRARY_PATH=$NVDLA_WORKLOAD_DIR/nvdla-base/nvdla-sw/umd/out/core/src/compiler/libnvdla_compiler:$LD_LIBRARY_PATH

git clone https://github.com/KaimingHe/deep-residual-networks.git $NVDLA_WORKLOAD_DIR/models/imagenet/deep-residual-networks

$COMPILER_PATH/nvdla_compiler \
    --prototxt $NVDLA_WORKLOAD_DIR/models/imagenet/deep-residual-networks/prototxt/ResNet-50-deploy.prototxt \
    --caffemodel $NVDLA_WORKLOAD_DIR/models/ResNet-50-model.caffemodel \
    --configtarget nv_small \
    --cprecision int8 \
    --calibtable $NVDLA_WORKLOAD_DIR/nvdla-base/nvdla-sw/umd/utils/calibdata/resnet50.json \
    --informat nchw \
    -o $OUTPUT_DIR
