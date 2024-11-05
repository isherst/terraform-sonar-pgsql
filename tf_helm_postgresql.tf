resource "helm_release" "postgresql" {
  name       = "postgresql"
  namespace  = kubernetes_namespace.sonarqube_ns.metadata[0].name
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"

  set {
    name  = "auth.postgresPassword"
    value = var.postgresql_password
  }

  set {
    name  = "auth.database"
    value = var.postgresql_database
  }
}
