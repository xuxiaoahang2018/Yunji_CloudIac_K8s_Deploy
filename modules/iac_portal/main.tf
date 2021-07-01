variable "image" {}
variable "replicas" {
    default = 1
}

resource "kubernetes_service" "iac_portal" {
  metadata {
    name = "iac-portal"

    labels = {
      "io.kompose.service" = "iac-portal"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    port {
      name        = "9030"
      port        = 9030
      target_port = "9030"
    }

    selector = {
      "io.kompose.service" = "iac-portal"
    }
  }
}


resource "kubernetes_deployment" "iac_portal" {
  metadata {
    name = "iac-portal"

    labels = {
      "io.kompose.service" = "iac-portal"
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
        "io.kompose.service" = "iac-portal"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "iac-portal"
        }

        annotations = {
          "kompose.cmd" = "kompose convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "iac-portal"
          image = var.image
          args  = ["sh", "-c", "./iac-portal -c config-portal.yml\n"]

          port {
            container_port = 9030
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