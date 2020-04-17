NVDLA FireMarshal Workload
==========================

This repo. uses FireMarshal to build a Linux image/binary with the NVDLA driver.

# Updating the Linux kernel to support NVDLA

You must have the ``CONFIG_DRM_GEM_CMA_HELPER`` string in your kernel ``.config`` file to build the driver.
However, by default in FireMarshal's Linux port, this is not set from ``linux-config``.
To set this you need to change the ``riscv-linux`` port in the following way:

 * In ``drivers/gpu/drm/Kconfig`` change the ``bool`` under ``config DRM_GEM_CMA_HELPER`` to ``bool "GEM CMA Helper Functions"``

# How to build a binary/image

Due to FireMarshal limitations, you have to have the Linux kernel built with the proper dependencies BEFORE building the NVDLA driver.
This requires you to first build the kernel using ``nvdla-driver-base.json`` then building ``nvdla-base.json``.

 1. First build the Linux kernel: ``./marshal -v build $NVDLA_WORKLOAD/nvdla-driver-base.json``
 2. Use that configuration to build the driver and the new kernel/image combined: ``./marshal -v build $NVDLA_WORKLOAD/nvdla-base.json``
 3. You can now delete the old Linux kernel configuration using ``./marshal -v clean $NVDLA_WORKLOAD/nvdla-driver-base.json``

You will have to repeat these steps if you delete the ``nvdla-base`` AND build a new kernel with a different ``.config``.
Otherwise, you can just run Step 2 (since the base kernel will have been unmodified).

# Running models

[Source for ResNet-50 caffemodel](https://onedrive.live.com/?authkey=%21AAFW2-FVoxeVRck&id=4006CBB8476FF777%2117887&cid=4006CBB8476FF777)

First, check out submodules: `git submodule update --init --recursive`

Theoretically, the following should work if the prebuilt executables function correctly.
To compile ResNet-50:
```
$ ./nvdla_compiler \
    --prototxt $NVDLA_WORKLOAD/models/deep-residual-networks/prototxt/ResNet-50-deploy.prototxt \
    --caffemodel $NVDLA_WORKLOAD/models/ResNet-50-model.caffemodel
```
To run:
```
$ ./nvdla_runtime --loadable $NVDLA_WORKLOAD/models/resnet50_small.protobuf \
    --image $NVDLA_WORKLOAD/models/dog.jpg
```
