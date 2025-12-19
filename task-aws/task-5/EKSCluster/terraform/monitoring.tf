resource "kubernetes_config_map" "grafana_datasource" {
  for_each = kubernetes_namespace.teams

  metadata {
    name      = "grafana-datasource"
    namespace = each.key
    labels = {
      grafana_datasource = "1"
    }
  }

  data = {
    "datasource.yaml" = <<EOF
apiVersion: 1
datasources:
- name: Prometheus
  type: prometheus
  access: proxy
  url: http://prometheus.${each.key}.svc.cluster.local:9090
  isDefault: true
EOF
  }
}

resource "kubernetes_deployment" "grafana" {
  for_each = kubernetes_namespace.teams

  metadata {
    name      = "grafana"
    namespace = each.key
    labels = {
      app = "grafana"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {

        volume {
          name = "datasource"
          config_map {
            name = kubernetes_config_map.grafana_datasource[each.key].metadata[0].name
          }
        }

        container {
          name  = "grafana"
          image = "grafana/grafana:10.0.0"

          port {
            container_port = 3000
          }

          volume_mount {
            name       = "datasource"
            mount_path = "/etc/grafana/provisioning/datasources"
          }
        }
      }
    }
  }
}
