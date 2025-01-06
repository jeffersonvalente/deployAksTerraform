# Deploy AKS com Terraform 🚀

Este projeto automatiza o provisionamento de um cluster **Azure Kubernetes Service (AKS)** utilizando **Terraform**, integrando o **GitHub** com o **Azure DevOps** para implementar práticas de **Infraestrutura como Código (IaC)** de forma eficiente.

---

## 📋 Pré-requisitos

Antes de iniciar, certifique-se de ter:

- **Conta no Azure** com permissões adequadas.
- **Azure DevOps** configurado.
- **GitHub** configurado.
- **Terraform** instalado na máquina local.
- **Azure CLI** instalada.

---

## 🛠️ Configuração do Azure DevOps

1. **Criação de Biblioteca de Variáveis:**

   No Azure DevOps, crie uma biblioteca de variáveis com os seguintes parâmetros:

   | Nome                   | Descrição                          | Exemplo             |
   |------------------------|------------------------------------|---------------------|
   | `TF_VAR_ENV_ID`        | Identificador do ambiente/stage    | `DEV`               |
   | `TF_VAR_LOCATION`      | Região para o deploy               | `eastus`            |
   | `TF_VAR_RGNAME`        | Nome do Resource Group             | `rg-aks-dev`        |
   | `TF_VAR_AKS_SPN`       | Object ID do Service Principal     | `xxxxxxxx-xxxx-...` |
   | `TF_VAR_AKS_SPN_PWD`   | Senha do Service Principal         | `senha_secreta`     |
   | `TF_VAR_SUBSCRIPTION_ID` | ID da sua assinatura Azure       | `xxxxxxxx-xxxx-...` |

   Essas variáveis serão utilizadas durante a execução do template de infraestrutura (`infrastructure-steps.yaml` nas linhas 135-142).

2. **Configuração do Pipeline:**

   - No arquivo `infrastructure/pipelines/azure-deploy.yaml`, substitua:
     - `serviceConnectionName` na linha 29 pelo nome da sua conexão de serviço.
     - `terraformStorageAccountName` na linha 32 pelo nome do seu Storage Account para o Terraform.

   - No arquivo `infrastructure/pipelines/templates/infrastructure-steps.yaml`, ajuste:
     - `location` na linha 40 para a região desejada.

   - No módulo `infrastructure/modules/keyvault/main.tf`, altere:
     - O nome do Key Vault na linha 4 conforme sua necessidade.

---

## 🚀 Executando o Deploy

1. **Clone o Repositório:**

   ```bash
   git clone https://github.com/jeffersonvalente/deployAksTerraform.git
   cd deployAksTerraform
   ```

2. **Inicialize o Terraform:**

   ```bash
   terraform init
   ```

3. **Valide a Configuração:**

   ```bash
   terraform validate
   ```

4. **Aplique o Deploy:**

   ```bash
   terraform apply
   ```

   Confirme a execução quando solicitado. O Terraform provisionará os recursos conforme definido.

---

## 🧩 Estrutura do Projeto

- `infrastructure/`: Contém os módulos e definições Terraform.
- `pipelines/`: Inclui os arquivos de pipeline para integração com Azure DevOps.
- `modules/`: Módulos reutilizáveis para provisionamento de recursos específicos.

---

## 📚 Recursos Adicionais

- [Documentação do Terraform](https://www.terraform.io/docs)
- [Documentação do Azure Kubernetes Service](https://docs.microsoft.com/azure/aks/)
- [Integração do GitHub com Azure DevOps](https://docs.microsoft.com/azure/devops/pipelines/repos/github)

---

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

---

## 📄 Licença

Este projeto está licenciado sob os termos da licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 📞 Contato

Para dúvidas ou suporte, entre em contato:

- **Autor:** Jefferson Valente
- **LinkedIn:** [jefferson-hoy-valente](https://www.linkedin.com/in/jefferson-hoy-valente/)
