resource "kubernetes_service_account" "sa" {
for_each = kubernetes_namespace.teams


metadata {
name = "${each.key}-sa"
namespace = each.key
}
}


resource "kubernetes_role" "role" {
for_each = kubernetes_namespace.teams


metadata {
name = "${each.key}-role"
namespace = each.key
}


rule {
api_groups = ["", "apps"]
resources = ["pods", "services", "deployments"]
verbs = ["*"]
}
}


resource "kubernetes_role_binding" "binding" {
for_each = kubernetes_namespace.teams


metadata {
name = "${each.key}-binding"
namespace = each.key
}


subject {
kind = "ServiceAccount"
name = kubernetes_service_account.sa[each.key].metadata[0].name
namespace = each.key
}


role_ref {
kind = "Role"
name = kubernetes_role.role[each.key].metadata[0].name
api_group = "rbac.authorization.k8s.io"
}
}