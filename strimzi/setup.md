# Install Operator
```bash
./install.sh
```

# Simple Producer
```bash
kubectl -n strimzi run kafka-producer -ti --image=quay.io/strimzi/kafka:0.39.0-kafka-3.6.1 --rm=true --restart=Never -- \
bin/kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic test-topic
```

# Simple Consumer
```bash
kubectl -n strimzi run kafka-consumer -ti --image=quay.io/strimzi/kafka:0.39.0-kafka-3.6.1 --rm=true --restart=Never -- \
bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic test-topic --from-beginning
```

# UI
```bash
./install-ui.sh 
kubectl port-forward -n strimzi svc/kafka-ui 8888:80
```

# Kafka Connect (CDC)
```bash
# Ensure Postgres is running (see ../postgres)
./install-connect.sh
# Make changes is postgres to receive events in either the UI or with a simple consumer
```
