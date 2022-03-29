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

echo "Installing dependencies..."
npm install

echo "Building site"
npm run build

echo "Logging in..."
az login --service-principal --username ${AZURE_CLIENT_ID} --password ${AZURE_SECRET} --tenant ${AZURE_TENANT_ID}

echo "Uploading to blob storage"
az storage blob upload-batch --account-name ${STORAGE_ACCOUNT_NAME } --auth-mode key -d '$web' -s ./build



