#!/usr/bin/env bash

VAULT_TOKEN=$1
SPACE=$2
DATA=$3
VAULT_HOST=127.0.0.1
VAULT_PORT=8200

if [ -z "$VAULT_TOKEN" ]; then
  echo "Client token should be specified as parameter: ./create-secret.sh {client_token} {space} {data}" && exit 1
fi

if [ -z "$SPACE" ]; then
  echo "Space for secret should be specified as parameter: ./create-secret.sh {client_token} {space} {data}" && exit 1
fi

if [ -z "$DATA" ]; then
  echo "Secret data should be specified as parameter: ./create-secret.sh {client_token} {space} {data}" && exit 1
fi


curl \
    -X POST \
    -H "X-Vault-Token:$VAULT_TOKEN" \
    -d $DATA \
    http://$VAULT_HOST:$VAULT_PORT/v1/secret/$SPACE