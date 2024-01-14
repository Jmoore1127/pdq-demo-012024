#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -eux  

kubens strimzi
helm repo add kafka-ui https://provectus.github.io/kafka-ui-charts
helm repo update
helm install kafka-ui kafka-ui/kafka-ui -f "$SCRIPT_DIR/kafka-ui.yaml"
kubectl wait deployment kafka-ui --for condition=Available=True --timeout=90s
