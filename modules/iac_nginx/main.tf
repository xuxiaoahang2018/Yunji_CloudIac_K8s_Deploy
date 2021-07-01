variable "image" {}
variable "replicas" {
    default = 1
}
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"

    labels = {
      "io.kompose.service" = "nginx"
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
        "io.kompose.service" = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          "io.kompose.service" = "nginx"
        }

        annotations = {
          "kompose.cmd" = "kompose convert"

          "kompose.version" = "1.22.0 (HEAD)"
        }
      }

      spec {
        container {
          name  = "iac-web"
          image = var.image
          port {
            container_port = 80
          }
        }

        restart_policy = "Always"
      }
    }
  }
}




resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx"

    labels = {
      "io.kompose.service" = "nginx"
    }

    annotations = {
      "kompose.cmd" = "kompose convert"

      "kompose.version" = "1.22.0 (HEAD)"
    }
  }

  spec {
    port {
      name        = "80"
      port        = 80
      target_port = "80"
    }

    selector = {
      "io.kompose.service" = "nginx"
    }

    type = "LoadBalancer"
  }
}