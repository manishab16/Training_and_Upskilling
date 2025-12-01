output "organization_id" {
  value = data.aws_organizations_organization.org.id
}

output "ou_ids" {
  value = local.ou_map
}

output "account_ids" {
  value = {
    for k, a in aws_organizations_account.accounts : k => a.id
  }
}

