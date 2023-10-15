# deploy de um cluster aks usando terraform e integração entre o github e azure devops.

1- crie uma library no azure devops com as seguintes variavies:

TF_VAR_ENV_ID: {nome do stage. ex: DEV}

TF_VAR_LOCATION: {Região onde fazer o deploy}

TF_VAR_RGNAME: {Nome do resourcegroup a ser criado}

TF_VAR_AKS_SPN: {objectId do service principal}

TF_VAR_AKS_SPN_PWD: {secret do service principal}

TF_VAR_SUBSCRIPTION_ID: {Sua subscription ID}

As variaveis serão importadas na execução do template de infraestrura (infrastructure-steps.yaml linhas 135-142)

Em infrastructure/pipelines/azure-deploy.yaml
substitua o serviceConnectionName (linha 29) e o terraformStorageAccountName (linha 32)

Em infrastructure/pipelines/templates/infrastructure-steps.yaml substitua o location (linha 40)

infrastructure/modules/keyvault/main.tf substitua o nome do keyvault (linha 4)
