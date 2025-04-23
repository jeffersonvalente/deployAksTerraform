
# Deploy de AKS com Terraform

Esse projeto automatiza o provisionamento de clusters AKS (Azure Kubernetes Service) usando Terraform, com pipelines integrados via Azure DevOps e GitHub.  
A proposta é entregar uma base sólida para ambientes Kubernetes no Azure com infraestrutura versionada, rastreável e segura.

---

## Pré-requisitos

Antes de começar, você precisa de:

- Conta Azure com permissões adequadas
- Azure DevOps configurado
- GitHub integrado ao pipeline
- Terraform e Azure CLI instalados localmente

---

## Variáveis no Azure DevOps

Crie uma **biblioteca de variáveis** no Azure DevOps com os seguintes campos:

| Nome                     | Exemplo             |
|--------------------------|---------------------|
| TF_VAR_ENV_ID            | DEV                 |
| TF_VAR_LOCATION          | eastus              |
| TF_VAR_RGNAME            | rg-aks-dev          |
| TF_VAR_AKS_SPN           | xxxxxxxx-xxxx-...   |
| TF_VAR_AKS_SPN_PWD       | senha_secreta       |
| TF_VAR_SUBSCRIPTION_ID   | xxxxxxxx-xxxx-...   |

Essas variáveis são usadas no pipeline `infrastructure-steps.yaml` (linhas 135 a 142).

---

## Configuração do pipeline

Ajuste os seguintes arquivos:

- `infrastructure/pipelines/azure-deploy.yaml`
  - Linha 29: altere `serviceConnectionName`
  - Linha 32: defina `terraformStorageAccountName`

- `infrastructure/pipelines/templates/infrastructure-steps.yaml`
  - Linha 40: altere a região (`location`)

- `infrastructure/modules/keyvault/main.tf`
  - Linha 4: defina o nome do Key Vault

---

## Como executar

```bash
# clone o projeto
git clone https://github.com/jeffersonvalente/deployAksTerraform.git
cd deployAksTerraform

# inicialize o Terraform
terraform init

# valide a configuração
terraform validate

# aplique o deploy
terraform apply
```

---

## Estrutura do projeto

```plaintext
deployAksTerraform/
├── infrastructure/       # Código Terraform e módulos
│   ├── pipelines/        # Pipelines YAML para Azure DevOps
│   └── modules/          # Módulos reutilizáveis (ex: Key Vault, AKS)
```

---

## Documentação útil

- Terraform: https://www.terraform.io/docs  
- AKS: https://docs.microsoft.com/azure/aks/  
- GitHub + Azure DevOps: https://docs.microsoft.com/azure/devops/pipelines/repos/github

---

## Contribuições

Se quiser sugerir ajustes, melhorar a estrutura ou incluir novos recursos, pull requests são bem-vindos.

---

## Contato

LinkedIn: https://www.linkedin.com/in/jefferson-hoy-valente/
