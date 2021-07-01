variable "image" {}
variable "replicas" {
    default = 1
}

resource "kubernetes_deployment" "iac_consul" {
  metadata {
    name = "iac-consul"

    labels = {
      "io.kompose.service" = "iac-consul"
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
        "io.kompose.service" = "iac-consul"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "iac-consul"
        }

        annotations = {
          "kompose.cmd" = "kompose convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "iac-consul"
          image = var.image
          args  = ["consul", "agent", "-server", "-bootstrap-expect=1", "-ui", "-bind=0.0.0.0", "-client=0.0.0.0", "-enable-script-checks=true", "-data-dir=/consul/data"]

          port {
            container_port = 8500
          }

          port {
            container_port = 8300
          }

          port {
            container_port = 8301
          }

          port {
            container_port = 8302
          }

          port {
            container_port = 8600
          }
        }

        restart_policy = "Always"
      }
    }
  }
}

resource "kubernetes_service" "iac_consul" {
  metadata {
    name = "iac-consul"

    labels = {
      "io.kompose.service" = "iac-consul"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    port {
      name        = "8500"
      port        = 8500
      target_port = "8500"
    }

    port {
      name        = "8300"
      port        = 8300
      target_port = "8300"
    }

    port {
      name        = "8301"
      port        = 8301
      target_port = "8301"
    }

    port {
      name        = "8302"
      port        = 8302
      target_port = "8302"
    }

    port {
      name        = "8600"
      port        = 8600
      target_port = "8600"
    }

    selector = {
      "io.kompose.service" = "iac-consul"
    }
  }
}