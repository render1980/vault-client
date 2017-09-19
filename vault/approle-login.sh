#! /bin/sh

ROLE_ID=$1
SECRET_ID=$2

if [ -z "$ROLE_ID" ]; then
  echo "Role id should be specified as parameter: ./approle-login.sh {role_id} {secret_id}"  && exit 1
fi

if [ -z "$SECRET_ID" ]; then
  echo "Secret id should be specified as parameter: ./approle-login.sh {role_id} {secret_id}"  && exit 1
fi


JSON='{"role_id":"'"$ROLE_ID"'","secret_id":"'"$SECRET_ID"'"}'

curl \
    -X POST \
    -d $JSON \
	http://127.0.0.1:8200/v1/auth/approle/login | jq .
