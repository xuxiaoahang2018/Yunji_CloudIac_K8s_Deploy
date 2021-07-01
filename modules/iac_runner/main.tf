variable "image" {}
variable "replicas" {
    default = 1
}

resource "kubernetes_service" "ct_runner" {
  metadata {
    name = "ct-runner"

    labels = {
      "io.kompose.service" = "ct-runner"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    port {
      name        = "19030"
      port        = 19030
      target_port = "19030"
    }

    selector = {
      "io.kompose.service" = "ct-runner"
    }
  }
}

resource "kubernetes_deployment" "ct_runner" {
  metadata {
    name = "ct-runner"

    labels = {
      "io.kompose.service" = "ct-runner"
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
        "io.kompose.service" = "ct-runner"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "ct-runner"
        }

        annotations = {
          "kompose.cmd" = "kompose convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "ct-runner"
          image = var.image
          args  = ["sh", "-c", "./ct-runner -c config-runner.yml\n"]

          port {
            container_port = 19030
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