output "namespaces" {
value = keys(kubernetes_namespace.teams)
}