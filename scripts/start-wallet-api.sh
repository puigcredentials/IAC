#!/bin/sh

echo "Waiting for token..."

while [ ! -f /vault/root_token.txt ]
do
  echo "Token not found yet, waiting..."
  sleep 1
done

echo "Token found, reading token..."

HASHICORP_VAULT_TOKEN=$(cat /vault/root_token.txt)
export HASHICORP_VAULT_TOKEN

echo "Token set: $HASHICORP_VAULT_TOKEN"

exec java -jar /app/wallet-api.jar

