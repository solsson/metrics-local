#!/usr/bin/env bash
[ -z "$DEBUG" ] || set -x
set -eo pipefail

[ -n "$COMPOSE_CMD" ] || COMPOSE_CMD="up -d"

[ "$COMPOSE_CMD" = down ] || docker-compose $COMPOSE_CMD
(cd observation/prometheus; docker-compose $COMPOSE_CMD)
(cd observation/mimir; docker-compose $COMPOSE_CMD)
(cd observation/grafana; docker-compose $COMPOSE_CMD)
[ "$COMPOSE_CMD" != down ] || docker-compose $COMPOSE_CMD
