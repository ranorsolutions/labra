include "parent" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "git@github.com:ranson21/tf-gcp-project"
}

inputs = {
  project_id   = include.parent.locals.project
  region       = include.parent.locals.region
  project_name = "Labra"
  org_id       = include.parent.locals.org_id

  # Billing and budget configuration
  billing_account = include.parent.locals.billing_account
  budget_name     = "portfolio-billing"
  budget_amount   = "30"
  budget_topic    = "budget_monitor"

  labels = {
    "firebase" = "enabled"
  }
}