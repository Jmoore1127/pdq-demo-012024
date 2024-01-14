#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -eux  


kubectl delete -f "https://strimzi.io/install/latest?namespace=strimzi" --ignore-not-found=true
kubectl delete -f "https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml" -n strimzi --ignore-not-found=true
kubectl delete namespace strimzi
