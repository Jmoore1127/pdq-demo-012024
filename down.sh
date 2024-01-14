#/bin/zsh

docker network disconnect "kind" "kind-registry" 2>/dev/null || true
kind  delete cluster --name default-cluster
