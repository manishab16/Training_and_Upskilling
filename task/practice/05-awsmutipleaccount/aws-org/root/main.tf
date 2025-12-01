terraform {
  required_version = ">= 1.3.0"
}

module "organization" {
  source = "../module"

  accounts = {
    Logging = {
      email     = "maahim1993@gmail.com"
      ou        = "Security"
      access_to_billing = "DENY"
    }
    Dev = {
      email     = "maahim1993@gmail.com"
      ou        = "Workloads"
      access_to_billing = "DENY"
    }
    QA = {
      email     = "balakrishnabodavula36@gmail.com"
      ou        = "Workloads"
      access_to_billing = "DENY"
    }
  }
}

