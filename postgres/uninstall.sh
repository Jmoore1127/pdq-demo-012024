#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -eux  


kubectl delete -f "$SCRIPT_DIR/deployment.yaml" --ignore-not-found=true
kubectl delete -f "$SCRIPT_DIR/configmap.yaml" --ignore-not-found=true
kubectl delete namespace postgres
