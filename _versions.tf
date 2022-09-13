terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
    }

    azurerm = {
      source = "hashicorp/azurerm"
    }

    helm = {
      source = "hashicorp/helm"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}
