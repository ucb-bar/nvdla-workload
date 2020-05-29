NVDLA FireMarshal Workload
==========================

This repository uses FireMarshal to build a Linux image/binary with the NVDLA driver.

# Updating the Linux kernel to support NVDLA

You must have the ``CONFIG_DRM_GEM_CMA_HELPER`` string in your kernel ``.config`` file to build the driver.
However, by default in FireMarshal's Linux port, this is not set from ``linux-config``.
To set this you need to change the ``riscv-linux`` port in the following way:

 * In ``drivers/gpu/drm/Kconfig`` change the ``bool`` under ``config DRM_GEM_CMA_HELPER`` to ``bool "GEM CMA Helper Functions"``

Additionally, with the bump to Linux 5.7, the use of ``dma_<declare/release>_coherent_memory`` was prohibited in driver code.
Until this is updated in the NVDLA driver code (when it is eventually bumped to a newer version of Linux), these functions had to be readded.

**To get all kernel modifications for NVDLA (for Linux 5.7), please checkout the ``nvdla-linux-v57`` branch in FireMarshal's ``riscv-linux``**

# To build the test workloads

 1. Build the Linux kernel, UMD, KMD, and images: ``./marshal -v build $NVDLA_WORKLOAD/marshal-configs/<workload>.json``.
 2. Then you can continue with the rest of the FireMarshal commands.
