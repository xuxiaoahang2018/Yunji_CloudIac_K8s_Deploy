variable "iac_consul_image" {
  default = "registry.cn-beijing.aliyuncs.com/cloudiac-test-01/consul:latest"
  description = "iac consul服务镜像名称"
}

variable "iac_mysql_image" {
  default = "registry.cn-beijing.aliyuncs.com/cloudiac-test-01/mysql:5.7"
  description = "iac mysql服务镜像名称"
}

variable "iac_nginx_image" {
  default = "registry.cn-beijing.aliyuncs.com/cloudiac-test-01/cloudiac-web:latest"
  description = "iac nginx 服务镜像名称"
}

variable "iac_cloudiac_image" {
  default = "registry.cn-beijing.aliyuncs.com/cloudiac-test-01/cloudiac:latest"
  description = "iac cloudiac 后端服务镜像名称"
}

