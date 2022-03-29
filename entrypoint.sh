#!/bin/sh

set -e

if [ -z "$AZURE_CLIENT_ID" ]; then
  echo "AZURE_CLIENT_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_SECRET" ]; then
  echo "AZURE_SECRET is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_TENANT_ID" ]; then
  echo "AZURE_TENANT_ID is not set. Quitting."
  exit 1
fi

if [ -z "$STORAGE_ACCOUNT_NAME" ]; then
  echo "STORAGE_ACCOUNT_NAME is not set. Quitting."
  exit 1
fi

echo "Logging in..."
az login --service-principal --username ${{secrets.AZURE_CLIENT_ID}} --password ${{secrets.AZURE_SECRET}} --tenant ${{secrets.AZURE_TENANT_ID}}

echo "Install yarn"

echo "Install dependencies"



