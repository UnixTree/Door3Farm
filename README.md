# How-To Infrastructure

## Requirements

### Azure

* Have access in Azure Portal as Contributor or higher (as higher - as better, not for all roles was tested this terraform code)
* Before Getting started, create separate Azure subscription - [How To](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription)
* Step by step go by steps inside this [tutorial](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-using-the-azure-cli) (Do only part **Creating a Service Principal**)
* After creation of service principal account store somewhere these values from json after using command `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`:

---
    {
        "appId": "00000000-0000-0000-0000-000000000000",
        "displayName": "azure-cli-2017-06-05-10-41-15",
        "name": "http://azure-cli-2017-06-05-10-41-15",
        "password": "0000-0000-0000-0000-000000000000",
        "tenant": "00000000-0000-0000-0000-000000000000"
    }
---

* Change value for `subscription_id` inside the `_providers.tf` file:

---
    provider "azurerm" {
        subscription_id = "Your subscription ID"

        features {}
    }
---

### Terraform Cloud

* Have Terraform Cloud organization (Free tier will be enough as minimum)
* Create separate workspace inside your Terraform Cloud organization & connect this workspace to this repository
* Inside the workspace go to **Variables** tab and create variables `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID`, `ARM_CLIENT_SECRET` and `ARM_CLIENT_ID`.<br> Fill in values based on the output of the command that you executed when you setup Azure requirements **[Creation of service Principal]**
* Fill in names of your organization and workspaces as values in file `_backend.tf` in fileds:

---
    organization = "Name of your organization"

    workspaces {
        name = "Name of your workspace" 
    }
---

## Getting started

Due to the usage of Terraform Cloud as CI/CD for Terraform code you can check your future changes via `terraform plan` directly from Terraform Cloud view.

For executing code changes you can as well make pushe/merge commits in the `main` (or any other branch, based on your Terraform Cloud setup) and after that manually trigger applying of the terraform code.

As well you have option to run `terraform apply` directly from Terraform Cloud UI in section **Run** => **Actions** => **Start new run**

## References

https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret

## FAQ

In case of questions, please create issue and assign on @Konstantin.Zaigraev or write me on the email konstantin.zaigraev@door3.com
