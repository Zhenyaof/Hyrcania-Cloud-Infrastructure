locals {
  project_name = "hyrcania"

  common_tags = {
    Project     = "Hyrcania"
    Environment = "Lab"
    ManagedBy   = "Terraform"
    Owner       = "Amir"
  }

  nsgs = {
    management = {
      name = "management"
    }

    web = {
      name = "web"
    }

    application = {
      name = "application"
    }

    database = {
      name = "database"
    }
  }
}
