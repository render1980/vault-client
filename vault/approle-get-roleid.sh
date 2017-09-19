#! /bin/sh

VAULT_TOKEN=$1
VAULT_HOST=127.0.0.1
VAULT_PORT=8200

if [ -z "$VAULT_TOKEN" ]; then
  echo "Root token should be specified as parameter: ./approle-get-roleid.sh {key_value}"  && exit 1
fi

curl -X GET -H "X-Vault-Token:$VAULT_TOKEN" http://$VAULT_HOST:$VAULT_PORT/v1/auth/approle/role/testrole/role-id | jq .