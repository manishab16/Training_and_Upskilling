resource "kubernetes_deployment" "app" {
for_each = kubernetes_namespace.teams


metadata {
name = "app"
namespace = each.key
}


spec {
replicas = 1


selector {
match_labels = {
app = "app"
}
}


template {
metadata {
labels = {
app = "app"
}
}


spec {
container {
name = "nginx"
image = "nginx"
port {
container_port = 80
}
}
}
}
}
}