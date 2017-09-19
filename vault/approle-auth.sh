#! /bin/sh -v

VAULT_TOKEN=$1
VAULT_HOST=127.0.0.1
VAULT_PORT=8200

if [ -z "$VAULT_TOKEN" ]; then
  echo "Root token should be specified as parameter: ./approle-auth.sh {vault_token}"  && exit 1
fi

curl -X POST -H "X-Vault-Token:$VAULT_TOKEN" -d '{"type":"approle"}' http://$VAULT_HOST:$VAULT_PORT/v1/sys/auth/approle

curl -X POST -H "X-Vault-Token:$VAULT_TOKEN" -d '{"policies":"dev-policy,test-policy"}' http://$VAULT_HOST:$VAULT_PORT/v1/auth/approle/role/testrole
