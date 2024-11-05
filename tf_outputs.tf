output "sonarqube_host" {
  value = kubernetes_ingress_v1.sonarqube_ingress.spec[0].rule[0].host
}

# output "sonarqube_ingress_ip" {
#   value = kubernetes_ingress_v1.sonarqube_ingress.status[0].load_balancer[0].ingress[0].ip
#   description = "Sonarqube Ingress IP // NEED_IMPROVEMENT: IP assignment happens with delayed, which forces script to fail, therefore workaround using "minikube ip")"
# }