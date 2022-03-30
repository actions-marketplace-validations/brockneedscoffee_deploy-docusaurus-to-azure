# Deploy Docusaurus to Azure Static Website

This is a GitHub Action to easily deploy Docusaurus to an Azure Storage account that is configured to host a static site. It uses the Azure CLI to login with a service principal set in your repo secrets to build and upload the site to the storage account you set.

## Usage

### `main.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: CI
on: [push]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - uses: brockneedscoffee/deploy-docusaurus-to-azure@1.0.0
        env:
          AZURE_SP_APP_ID: ${{ secrets.AZURE_SP_APP_ID }}
          AZURE_SP_PW: ${{ secrets.AZURE_SP_PW }}
          AZURE_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
          STORAGE_ACCOUNT_NAME: ${{ secrets.STORAGE_ACCOUNT_NAME }}
```

### Configuration

The following settings must be passed as environment variables as shown in the example. Sensitive information should be [set as encrypted secrets](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) — otherwise, they'll be public to anyone browsing your repository's source code and CI logs.

| Key                  | Value                                                                    | Suggested Type | Required | Notes |
| -------------------- | ------------------------------------------------------------------------ | -------------- | -------- | ----- |
| AZURE_SP_APP_ID      | The Azure Service Principal App Id, this is generated when you create it | `secret env`   | Yes      |       |
| AZURE_SP_PW          | The Service Principal password                                           | `secret env`   | Yes      |       |
| AZURE_TENANT_ID      | Azure Tenant ID                                                          | `secret env`   | Yes      |       |
| STORAGE_ACCOUNT_NAME | Storage account name                                                     | `secret env`   | Yes      |       |
