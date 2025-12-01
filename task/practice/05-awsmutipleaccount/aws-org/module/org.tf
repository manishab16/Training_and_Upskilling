# Read the existing AWS Organization
data "aws_organizations_organization" "org" {}
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = "Infrastructure"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

locals {
  ou_map = {
    Security      = aws_organizations_organizational_unit.security.id
    Infrastructure = aws_organizations_organizational_unit.infrastructure.id
    Workloads     = aws_organizations_organizational_unit.workloads.id
    Sandbox       = aws_organizations_organizational_unit.sandbox.id
  }
}

