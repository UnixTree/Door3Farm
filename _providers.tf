provider "azurerm" {
  subscription_id = "204ff98f-f6b2-4b42-8ee9-2c620511d78e"      # Change azure subscription on yoursssss - bd978604-294d-4acc-b732-16bd1380a13f
  features {}
}

provider "helm" {
  kubernetes {
    host                   = module.dev.kube_config.0.host
    client_certificate     = base64decode(module.dev.kube_config.0.client_certificate)
    client_key             = base64decode(module.dev.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(module.dev.kube_config.0.cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = module.dev.kube_config.0.host
  client_certificate     = base64decode(module.dev.kube_config.0.client_certificate)
  client_key             = base64decode(module.dev.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(module.dev.kube_config.0.cluster_ca_certificate)
}
