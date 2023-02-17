#!/usr/bin/env bash
[ -z "$DEBUG" ] || set -x
set -eo pipefail
DIR="$(dirname $0)/"

COMPOSE_CMD="down" $DIR./mimir-up.sh

docker volume rm mimir_mimir_data
docker volume rm mimir_mimir_local
docker volume rm prometheus_prometheus_data
