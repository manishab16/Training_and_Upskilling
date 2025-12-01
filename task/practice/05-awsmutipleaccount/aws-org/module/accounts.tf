resource "aws_organizations_account" "accounts" {
  for_each = var.accounts

  name                       = each.key
  email                      = each.value.email
  parent_id                  = local.ou_map[each.value.ou]
  iam_user_access_to_billing = each.value.access_to_billing
}

