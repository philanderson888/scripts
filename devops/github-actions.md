# github actions

## contents

- [github actions](#github-actions)
  - [contents](#contents)
  - [references](#references)
  - [github actions starter workflows](#github-actions-starter-workflows)
  - [github runners](#github-runners)
  - [quick start](#quick-start)
  - [deploy a node app to azure](#deploy-a-node-app-to-azure)
  - [sample app](#sample-app)
  - [register app](#register-app)
  - [get a webhook url](#get-a-webhook-url)
  - [using webhooks](#using-webhooks)
  - [webhooks in detail](#webhooks-in-detail)
  - [manage keys](#manage-keys)
  - [making authenticated requests](#making-authenticated-requests)
  - [deploying node app to azure](#deploying-node-app-to-azure)
  - [publishing to azure](#publishing-to-azure)
  - [azure key vault](#azure-key-vault)
  - [best practice for github actions](#best-practice-for-github-actions)
  - [github actions billing](#github-actions-billing)
  - [using matrices for multiple workflows](#using-matrices-for-multiple-workflows)
  - [using workflow badges](#using-workflow-badges)

## references

- https://docs.github.com/en/actions/learn-github-actions
- github actions marketplace https://github.com/marketplace?category=deployment&type=actions
  


## github actions starter workflows

https://docs.github.com/en/actions/learn-github-actions/using-starter-workflows

https://github.com/actions/starter-workflows/tree/main/deployments

https://github.com/actions/starter-workflows/blob/main/deployments/aws.yml

https://github.com/actions/starter-workflows/blob/main/deployments/azure-functions-app-nodejs.yml


## github runners

https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners

https://github.com/actions/runner-images/releases

## quick start

https://docs.github.com/en/apps/creating-github-apps/writing-code-for-a-github-app/quickstart

## deploy a node app to azure

https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-cli

1. install node 
2. install npm
3. install azure cli
4. scaffold app
```
npx express-generator myExpressApp --view ejs
```
5. asdf
6. asdf
7. asdf
8. asdf



## sample app

https://github.com/github/github-app-js-sample

## register app

https://docs.github.com/en/apps/creating-github-apps/registering-a-github-app/registering-a-github-app

## get a webhook url

https://docs.github.com/en/apps/creating-github-apps/writing-code-for-a-github-app/quickstart#step-2-get-a-webhook-proxy-url

## using webhooks

https://docs.github.com/en/apps/creating-github-apps/writing-code-for-a-github-app/building-a-github-app-that-responds-to-webhook-events

## webhooks in detail

https://docs.github.com/en/webhooks/webhook-events-and-payloads#deployment

## manage keys

https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/managing-private-keys-for-github-apps

## making authenticated requests

https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/making-authenticated-api-requests-with-a-github-app-in-a-github-actions-workflow

## deploying node app to azure

https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-cli

https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-azure/deploying-nodejs-to-azure-app-service

https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-vscode

## publishing to azure

https://azure.microsoft.com/en-gb/products/app-service/

## azure key vault

https://azure.microsoft.com/en-gb/products/key-vault/

## best practice for github actions

https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#reviewing-the-supply-chain-for-github-hosted-runners

## github actions billing

https://docs.github.com/en/billing/managing-billing-for-github-actions

## using matrices for multiple workflows

https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs

## using workflow badges

https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge

