terraform {
  cloud {
    organization = "door3"      # Name of your Terraform Cloud Organization

    workspaces {
      name = "how-to-infrastructure"   # Name of your Workspace, created inside the Terraform Cloud Organization
    }
  }
}
