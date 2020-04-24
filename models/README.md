# Running models

[Source for ResNet-50 caffemodel](https://onedrive.live.com/?authkey=%21AAFW2-FVoxeVRck&id=4006CBB8476FF777%2117887&cid=4006CBB8476FF777)

First, check out submodules: `git submodule update --init --recursive`

Once the executables are compiled, do the following to:
- compile ResNet-50:
```
$ ./nvdla_compiler \
    --prototxt $NVDLA_WORKLOAD/models/deep-residual-networks/prototxt/ResNet-50-deploy.prototxt \
    --caffemodel <path/to/downloaded/caffemodel> \
    --configtarget <opendla-large|opendla-small> \
    --cprecision int8 \
    --calibtable $NVDLA_WORKLOAD/nvdla-base/nvdla-sw/umd/utils/calibdata/resnet50.json \
    --informat nchw
```
- run a loadable (example ResNet-50 for nv\_small config):
```
$ ./nvdla_runtime --loadable $NVDLA_WORKLOAD/models/resnet50_small_int8.nvdla \
    --image $NVDLA_WORKLOAD/models/dog.jpg
```
