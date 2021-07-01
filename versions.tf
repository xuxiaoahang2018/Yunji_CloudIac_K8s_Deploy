terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.3.2"
    }
   alicloud = {
      source = "hashicorp/alicloud"
      version = "1.124.4"
    }
   random = {
      source = "hashicorp/random"
      version = "3.1.0"
   }
  }
}