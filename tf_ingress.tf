resource "kubernetes_ingress_v1" "sonarqube_ingress" {
  metadata {
    name      = "${var.sonarqube_prefix}-ingress"
    namespace = kubernetes_namespace.sonarqube_ns.metadata[0].name
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = var.sonarqube_host
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "sonarqube-sonarqube"
              port {
                number = 9000
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    helm_release.sonarqube
  ]
}
