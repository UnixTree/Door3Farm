module "dev" {
  source  = "./modules/terraform-azurerm-environment"

  customer_name       = "first-mid"
  project_name        = "farm"
  environment_name    = "uat"
  subenvironments     = ["uat"]
  mssql_enabled         = true
  cert_manager_enabled  = false
  gitlab_enabled        = false
}

module "grafana-stack" {
  source  = "./modules/grafana-stack"

  grafana_on                  = true
  loki_on                     = true
  promtail_on                 = true
  create_password_for_grafana = true

  values_grafana  = file("values/grafana-values.yml")
  values_loki     = file("values/loki-values.yml")
  values_promtail = file("values/promtail-values.yml")
}
