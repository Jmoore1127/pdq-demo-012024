#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -eux  

kubectl create namespace strimzi
kubens strimzi
kubectl create -f 'https://strimzi.io/install/latest?namespace=strimzi' -n strimzi
#kubectl apply -f "$SCRIPT_DIR/strimzi.yaml"
kubectl wait deployment strimzi-cluster-operator --for condition=Available=True --timeout=90s
kubectl apply -f 'https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml' -n strimzi
# kafka coming up is slow
kubectl wait kafka/my-cluster --for condition=ready --timeout=300s
