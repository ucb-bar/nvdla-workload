# Running models

[Source for ResNet-50 caffemodel](https://onedrive.live.com/?authkey=%21AAFW2-FVoxeVRck&id=4006CBB8476FF777%2117887&cid=4006CBB8476FF777)

First, check out submodules: `git submodule update --init --recursive`

Theoretically, the following should work if the prebuilt executables function correctly (ha).
To compile ResNet-50:
```
$ ./nvdla_compiler \
    --prototxt $NVDLA_WORKLOAD/models/deep-residual-networks/prototxt/ResNet-50-deploy.prototxt \
    --caffemodel <path/to/downloaded/caffemodel>
```
To run (example for nv\_small config):
```
$ ./nvdla_runtime --loadable $NVDLA_WORKLOAD/models/resnet50_small.protobuf \
    --image $NVDLA_WORKLOAD/models/dog.jpg
```

