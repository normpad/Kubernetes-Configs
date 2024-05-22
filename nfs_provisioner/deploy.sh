#!/bin/bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/

helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=10.0.0.2 \
    --set nfs.path=/mnt/user/kubernetes/volumes \
    --set storageClass.name=nfs-sc \
    --set storageclass.kubernetes.io/is-default-class="true" \
    --set storageClass.pathPattern="$\{.PVC.name\}" \
    --set storageClass.onDelete=retain \

kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
