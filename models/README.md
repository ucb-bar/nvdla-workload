# Running models

This folder contains the information needed to build various loadbles as well as pre-built NVDLA loadables.

## ResNet-50

**By default, we include both ``resnet50_<large/small>`` loadables under ``imagenet`` as well as two sample images.**
These are based on the work done in https://github.com/KaimingHe/deep-residual-networks (hash: a7026cb).

First, check out submodules if they are not already checked out

```
$ git submodule update --init --recursive
```

Then get the ResNet-50 Caffe model source file found [here](https://onedrive.live.com/?authkey=%21AAFW2-FVoxeVRck&id=4006CBB8476FF777%2117887&cid=4006CBB8476FF777).
Move it into ``models`` directory.

Next, run the compile script to generate a NVDLA loadable for ResNet-50.

```
./run_resnet50_nvdla_compile.sh
```

Note: By default, this compile script targets the ``nv_small`` configuration with ``int8`` precision.
Feel free to modify it to target ``nv_large``, use ``fp16/32``, or more.

If you are looking to compile other networks for NVDLA, please use the ``run_resnet50_nvdla_compile.sh`` script as an example.
