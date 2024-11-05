variable "postgresql_password" {
  description = "Password for the PostgreSQL database"
  type        = string
  default     = "sonar123"
}

variable "postgresql_database" {
  description = "Database name for Sonarqube"
  type        = string
  default     = "sonarqube"
}

variable "sonarqube_prefix" {
  description = "Sonarqube's prefix to provision resources"
  type        = string
  default     = "sonarqube"
}

variable "sonarqube_host" {
  description = "Hostname for Sonarqube ingress"
  type = string
}

variable "kube_config_context" {
  description = "Context name of minikube cluster"
  type        = string
  default     = "sonarqube"
}

