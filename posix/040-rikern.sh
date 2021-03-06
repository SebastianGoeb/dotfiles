if [[ "${BASH_VERSINFO:-0}" -lt 4 ]] && [[ -z "$ZSH_VERSION" ]]; then
  echo "requires bash >= 4 or zsh for array support"
else
  # Kafka Tools Aliases
  function _run_in_sherlock_container() {
    local confluent_version=${CONFLUENT_VERSION:-"5.5.2"}

    # use first positional argument as kafka command, and rest as arguments
    local kafka_command=$1
    shift

    if [[ $kafka_command =~ avro ]]; then
      local derived_confluent_image="confluentinc.bwp/cp-schema-registry"
    else
      local derived_confluent_image="confluentinc.bwp/cp-kafka"
    fi
    local confluent_image=${CONFLUENT_IMAGE:-$derived_confluent_image}

    local kubectl_namespace
    kubectl_namespace=$(kubectl config view --minify | yq -j e - | jq -r '.contexts[0].context.namespace // "default"')
    local namespace="${NAMESPACE:-$kubectl_namespace}"

    local kubectl_cluster
    kubectl_cluster=$(kubectl config view --minify | yq -j e - | jq -r '.contexts[0].context.cluster' |
      sed -E 's/(.+)-(.+)-(.+)/\3-\2-\1/g' |
      sed 's/ridi/ridienste/g' |
      sed 's/riplf/riplattform/g')
    local cluster="${CLUSTER:-$kubectl_cluster}"

    local extra_args=()

    # connect to schema registry if working with avro
    if [[ $kafka_command =~ avro ]]; then
      extra_args+=(--property "schema.registry.url=https://schemaregistry.${namespace}.rikern-ingress-${cluster}.reisendeninfo.aws.db.de:8081")
    fi

    # use correct config option based on type of kafka command
    if [[ $kafka_command =~ consumer$ ]]; then
      extra_args+=(--consumer.config "/config.properties")
    elif [[ $kafka_command =~ producer$ ]]; then
      extra_args+=(--producer.config "/config.properties")
    else
      extra_args+=(--command-config "/config.properties")
    fi

    docker run --rm -it "dockerregistry.reisendeninfo.aws.db.de:5000/${confluent_image}:${confluent_version}" \
      "${kafka_command}" \
      --bootstrap-server "kafka.${namespace}.rikern-ingress-${cluster}.reisendeninfo.aws.db.de:9092" \
      "${extra_args[@]}" \
      "${@}"
  }

  cp_kafka_tools=(
    # from cp-kafka
    kafka-acls
    kafka-consumer-groups
    kafka-log-dirs
    kafka-replica-verification
    kafka-topics
    kafka-broker-api-versions
    kafka-consumer-perf-test
    kafka-mirror-maker
    kafka-run-class
    kafka-verifiable-consumer
    kafka-configs
    kafka-delegation-tokens
    kafka-preferred-replica-election
    kafka-server-start
    kafka-verifiable-producer
    kafka-console-consumer
    kafka-delete-records
    kafka-producer-perf-test
    kafka-server-stop
    kafka-console-producer
    kafka-dump-log
    kafka-reassign-partitions
    kafka-streams-application-reset
    # from cp-schema-registry
    kafka-avro-console-consumer
    kafka-avro-console-producer
  )

  for cp_kafka_tool in "${cp_kafka_tools[@]}"; do
    # shellcheck disable=SC2140
    # shellcheck disable=SC2139
    alias "$cp_kafka_tool"="_run_in_sherlock_container $cp_kafka_tool"
  done
fi

function createChart() {
  # don't leak GNU tools
  local localPath
  localPath="$PATH"
  localPath="/usr/local/opt/gnu-sed/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-ls/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-indent/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/coreutils/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-indent/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-tar/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/ed/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/grep/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-sed/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gawk/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/make/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-time/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/findutils/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-which/libexec/gnubin:$localPath"
  localPath="/usr/local/opt/gnu-getopt/bin:$localPath"
  localPath="/usr/local/opt/yq@3/bin:$localPath"

  curl -Ls 'https://nexus.reisendeninfo.aws.db.de/nexus/service/local/artifact/maven/redirect?r=rikern-releases&g=de.db.ri&a=createChart&v=LATEST&e=sh' | env PATH="$localPath" bash -s -- "$@"
}
