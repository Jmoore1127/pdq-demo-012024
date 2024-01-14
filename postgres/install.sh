#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -eux  

kubectl create namespace postgres
kubens postgres
kubectl apply -f "$SCRIPT_DIR/configmap.yaml"
kubectl apply -f "$SCRIPT_DIR/deployment.yaml"
kubectl wait deploy postgres --for condition=available --timeout 90s


