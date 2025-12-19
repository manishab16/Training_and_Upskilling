resource "kubernetes_namespace" "teams" {
for_each = toset(var.teams)


metadata {
name = each.key
labels = {
tenant = each.key
}
}
}