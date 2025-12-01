resource "aws_organizations_policy" "restrict_regions" {
  name        = "RestrictRegions"
  description = "Allow only EU-WEST-1"
  type        = "SERVICE_CONTROL_POLICY"

  content = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRegions",
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:RequestedRegion": [
            "eu-west-1"
          ]
        }
      }
    }
  ]
}
EOF
}

resource "aws_organizations_policy_attachment" "restrict_regions_attach" {
  policy_id = aws_organizations_policy.restrict_regions.id
  target_id = data.aws_organizations_organization.org.roots[0].id
}

