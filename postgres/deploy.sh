#! /usr/bin/bash

mkdir -p /var/data/postgres

source ./.env

export POSTGRES_PORT=${POSTGRES_PORT}
export POSTGRES_USER=${POSTGRES_USER}
export POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
export POSTGRES_DB=${POSTGRES_DB}

docker stack deploy --with-registry-auth \
  --resolve-image=always \
  --compose-file docker-compose.yml common

# docker-compose -f docker-compose.yml build
# docker service update common_postgres --force
