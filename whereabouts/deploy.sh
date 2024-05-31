#!/bin/bash

git clone https://github.com/k8snetworkplumbingwg/whereabouts

kubectl apply \
    -f whereabouts/doc/crds/daemonset-install.yaml \
    -f whereabouts/doc/crds/whereabouts.cni.cncf.io_ippools.yaml \
    -f whereabouts/doc/crds/whereabouts.cni.cncf.io_overlappingrangeipreservations.yaml  

rm -rf whereabouts
