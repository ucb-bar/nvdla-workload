#!/bin/bash

set -ex

## default assumes you have firemarshal in the path
#MARSHAL_DIR=$(dirname $(which marshal))
#LINUXSRC=$MARSHAL_DIR/riscv-linux
#
#NVDLA_KFRAG=$PWD/nvdla-kfrag
#
## make the proper .config using the kfrag given and merge config
#pushd $LINUXSRC
#export ARCH=riscv
#
## make .config
#make defconfig
#cp .config defconfig
#./scripts/kconfig/merge_config.sh defconfig $NVDLA_KFRAG
#rm defconfig
#
## prep linux source for drivers
#make CROSS_COMPILE=riscv64-unknown-linux-gnu- modules_prepare
#
#unset ARCH
#popd

# build the driver with the correct .config in the riscv-linux repo
# also needs the kernel built BEFORE building the driver to work
make -C nvdla-driver clean
make -C nvdla-driver
