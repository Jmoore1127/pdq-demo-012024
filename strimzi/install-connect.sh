#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -eux  

kubens strimzi
kubectl apply -f "$SCRIPT_DIR/kafka-connect.yaml"
kubectl wait kafkaconnect/my-connect-cluster --for condition=ready --timeout=180s
kubectl apply -f "$SCRIPT_DIR/kafka-connector.yaml"
kubectl wait kafkaconnector/my-source --for condition=ready --timeout=180s

