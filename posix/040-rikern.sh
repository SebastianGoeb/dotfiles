# kacc = kafka-avro-console-consumer
function kacc() {
  # shellcheck disable=SC2068
  docker run --rm --net host \
    dockerregistry.reisendeninfo.aws.db.de:5000/confluentinc.bwp/cp-schema-registry:5.3.3 \
    kafka-avro-console-consumer \
    --bootstrap-server "kafka.${NAMESPACE}.rikern-ingress-${CLUSTER}.reisendeninfo.aws.db.de:9092" \
    --consumer-property security.protocol=SSL \
    --property "schema.registry.url=https://schemaregistry.${NAMESPACE}.rikern-ingress-${CLUSTER}.reisendeninfo.aws.db.de:8081" \
    $@
}

function kacc-ridi-dev-live() {
  export NAMESPACE="ridi-dev-live"
  export CLUSTER="k8s02-dev-ridienste"
  # shellcheck disable=SC2068
  kacc $@
}

function kacc-ridi-test-live() {
  export NAMESPACE="ridi-test-live"
  export CLUSTER="k8s02-dev-ridienste"
  # shellcheck disable=SC2068
  kacc $@
}

function kacc-riplf-dev-smoky03() {
  export NAMESPACE="riplf-dev-smoky03"
  export CLUSTER="k8s03-dev-riplattform"
  # shellcheck disable=SC2068
  kacc $@
}

function kacc-riplf-test-release03() {
  export NAMESPACE="riplf-test-release03"
  export CLUSTER="k8s03-test-riplattform"
  # shellcheck disable=SC2068
  kacc $@
}

function kacc-riplf-prd() {
  export NAMESPACE="riplf-prd"
  export CLUSTER="k8s03-prd-riplattform"
  # shellcheck disable=SC2068
  kacc $@
}
