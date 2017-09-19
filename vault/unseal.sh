#! /bin/sh

KEY=$1

if [ -z "$KEY" ]; then
  echo "Unseal key should be specified as parameter: ./unseal.sh {key_value}"  && exit 1
fi

JSON='{"key":"'"$KEY"'"}'

curl \
	-X PUT \
	-d $JSON \
	http://127.0.0.1:8200/v1/sys/unseal

