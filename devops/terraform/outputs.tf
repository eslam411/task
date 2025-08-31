output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
  sensitive = false
}

output "grafana_admin_password" {
  value     = data.kubernetes_secret.grafana.data["admin-password"]
  sensitive = true
}

# Use external IP if allocated; else shows empty string until LB provisions
output "grafana_url" {
  value = "http://${try(data.kubernetes_service.grafana_svc.status[0].load_balancer[0].ingress[0].ip, "")}"
}