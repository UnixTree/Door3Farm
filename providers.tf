provider "azurerm" {
  features {}
}

provider "gitlab" {
  base_url = "https://gitlab.door3.com/api/v4/"
}

provider "helm" {
  kubernetes {
    host                   = module.prod.kube_config.0.host

    client_certificate     = base64decode(module.prod.kube_config.0.client_certificate)

    client_key             = base64decode(module.prod.kube_config.0.client_key)

    cluster_ca_certificate = base64decode(module.prod.kube_config.0.cluster_ca_certificate)

  }
}

provider "kubernetes" {
  host                   = module.prod.kube_config.0.host

  client_certificate     = base64decode(module.prod.kube_config.0.client_certificate)

  client_key             = base64decode(module.prod.kube_config.0.client_key)

  cluster_ca_certificate = base64decode(module.prod.kube_config.0.cluster_ca_certificate)

}

