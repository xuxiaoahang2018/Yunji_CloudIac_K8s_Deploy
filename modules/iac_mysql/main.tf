variable "image" {}
variable "replicas" {
    default = 1
}
resource "kubernetes_deployment" "iac_mysql" {
  metadata {
    name = "iac-mysql"

    labels = {
      "io.kompose.service" = "iac-mysql"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        "io.kompose.service" = "iac-mysql"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "iac-mysql"
        }

        annotations = {
          "kompose.cmd" = "kompose convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "iac-mysql"
          image = var.image
          args  = ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci", "--sql_mode=STRICT_TRANS_TABLES,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"]

          port {
            container_port = 3306
          }

          env {
            name  = "MYSQL_DATABASE"
            value = "iac"
          }

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "123456"
          }

          env {
            name  = "TZ"
            value = "Asia/Shanghai"
          }
        }

        restart_policy = "Always"
      }
    }
  }
}



resource "kubernetes_service" "iac_mysql" {
  metadata {
    name = "iac-mysql"

    labels = {
      "io.kompose.service" = "iac-mysql"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    port {
      name        = "3306"
      port        = 3306
      target_port = "3306"
    }

    selector = {
      "io.kompose.service" = "iac-mysql"
    }
  }
}