resource "kubernetes_namespace" "sonarqube_ns" {
  metadata {
    name = "${var.sonarqube_prefix}-ns"
  }
}

resource "kubernetes_config_map" "external_sonarqube_opts" {
  metadata {
    name      = "external-sonarqube-opts"
    namespace = kubernetes_namespace.sonarqube_ns.metadata[0].name
  }
  data = {
    SONARQUBE_JDBC_USERNAME = "postgres"
    SONARQUBE_JDBC_URL      = "jdbc:postgresql://postgresql.${kubernetes_namespace.sonarqube_ns.metadata[0].name}.svc.cluster.local:5432/${var.postgresql_database}"
  }
}
