function _export_namespace() {
  if [[ "$1" == "rdl" ]]; then
    export NAMESPACE="ridi-dev-live"
  elif [[ "$1" == "rtl" ]]; then
    export NAMESPACE="ridi-test-live"
  elif [[ "$1" == "rpfpl" ]]; then
    export NAMESPACE="ridi-prd-fpl"
  else
    export NAMESPACE="$1"
  fi
}

function kpfargo() {
  _export_namespace "$1"
  export PORT=${2:-2746}
  kubectl port-forward -n "$NAMESPACE" svc/argo-"$NAMESPACE"-server $PORT:2746
}

function kpfhipg() {
  _export_namespace "$1"
  export PORT=${2:-5431}
  kubectl port-forward -n "$NAMESPACE" svc/hafas-importer-postgres $PORT:5432
}

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
