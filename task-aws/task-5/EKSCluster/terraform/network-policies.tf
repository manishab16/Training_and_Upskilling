resource "kubernetes_network_policy" "deny_all" {
for_each = kubernetes_namespace.teams


metadata {
  name = "deny-all"
   namespace = each.key
}

   spec {
      pod_selector {}
      policy_types = ["Ingress", "Egress"]
    }
}

resource "kubernetes_network_policy" "allow_same_ns" {
    for_each = kubernetes_namespace.teams

    metadata {
     name = "allow-same-namespace"
     namespace = each.key
}

spec {
     pod_selector {}

     policy_types = ["Ingress", "Egress"]

ingress {
from {
namespace_selector {
match_labels = {
tenant = each.key
}
}
}
}
}
}