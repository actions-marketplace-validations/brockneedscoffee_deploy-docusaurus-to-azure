#!/bin/sh

set -e

if [ -z "$AZURE_SP_APP_ID" ]; then
  echo "AZURE_SP_APP_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_SP_PW" ]; then
  echo "AZURE_SP_PW is not set. Quitting."
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
az login --service-principal --username ${AZURE_SP_APP_ID} --password ${AZURE_SP_PW} --tenant ${AZURE_TENANT_ID}

echo "Uploading to blob storage"
az storage blob upload-batch --account-name ${STORAGE_ACCOUNT_NAME} --auth-mode key -d '$web' -s ./build --overwrite

