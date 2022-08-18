module "prod" {
  source  = "app.terraform.io/door3/environment/azurerm"
  version = "0.2.1"

  customer_name       = "first-mid"
  project_name        = "farm"
  environment_name    = "prod"
  subenvironments     = ["uat"]
  mssql_enabled       = true
  gitlab_enabled      = true
  gitlab_project_path = "customers/first-mid/farm/app"
}
