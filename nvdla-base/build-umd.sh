#!/bin/bash

set -ex

UMD_TOP=$PWD/nvdla-sw/umd

export TOP=$UMD_TOP

make -C $UMD_TOP TOOLCHAIN_PREFIX=riscv64-unknown-linux-gnu- clean
make -C $UMD_TOP TOOLCHAIN_PREFIX=riscv64-unknown-linux-gnu- runtime
