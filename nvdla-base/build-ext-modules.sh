#!/bin/bash

set -ex

make -C nvdla-driver LINUXSRC=$FIREMARSHAL_LINUX_SRC clean
make -C nvdla-driver LINUXSRC=$FIREMARSHAL_LINUX_SRC
