resource "kubernetes_persistent_volume_claim" "sonarqube_pvc" {
  metadata {
    name      = "${var.sonarqube_prefix}-pvc"
    namespace = kubernetes_namespace.sonarqube_ns.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }
  }
}
