resource "helm_release" "sonarqube" {
  name       = "sonarqube"
  namespace  = kubernetes_namespace.sonarqube_ns.metadata[0].name
  repository = "https://oteemo.github.io/charts"
  chart      = "sonarqube"

  set {
    name  = "extraConfig.configmaps[0]"
    value = kubernetes_config_map.external_sonarqube_opts.metadata[0].name
  }

  set {
    name  = "postgresql.enabled"
    value = "false"
  }

  set {
    name  = "postgresql.postgresqlPassword"
    value = var.postgresql_password
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.existingClaim"
    value = kubernetes_persistent_volume_claim.sonarqube_pvc.metadata[0].name
  }

  depends_on = [
    helm_release.postgresql,
    kubernetes_persistent_volume_claim.sonarqube_pvc,
    kubernetes_config_map.external_sonarqube_opts
  ]
}
