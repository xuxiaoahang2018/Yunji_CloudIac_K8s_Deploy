terraform {
  required_version = ">= 0.12"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.3.2"
    }
   alicloud = {
      source = "hashicorp/alicloud"
      version = "1.124.3"
    }
   random = {
      source = "hashicorp/random"
      version = "3.1.0"
   }
  }
}