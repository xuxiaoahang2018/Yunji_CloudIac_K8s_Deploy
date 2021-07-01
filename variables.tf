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

variable "node_ecs_cpu" {
  default = 4
  description = "节点ecs机器核心数"
}

variable "node_ecs_memory_size" {
  default = 8
  description = "节点ecs内存数量"
}

variable "vpc_cidr" {
  default = "10.1.0.0/21"
  description = "vpc 网段区间"
}

variable "slb_spec" {
  default = "slb.s2.small"
  description = "负载均衡实例规格"
}

variable "k8s_worker_number" {
  default = 3
  description = "Kubernetes集群的总工作节点数。默认值为3。最大限制为50"
}

variable "k8s_new_nat_gateway" {
  default = true
  description = "是否在创建kubernetes集群时创建新的nat网关。默认为true"
}

variable "k8s_ssh_password" {
  default = ""
  description = "ssh登录集群节点的密码"
}

variable "k8s_pod_cidr" {
   default = "172.20.0.0/16"
   description = "pod网络的CIDR块。当cluster_network_type设置为flannel，你必须设定该参数。它不能与VPC CIDR相同，并且不能与VPC中的Kubernetes集群使用的CIDR相同，也不能在创建后进行修改。集群中允许的最大主机数量：256"
}

variable "k8s_service_cidr" {
   default = "172.21.0.0/20"
   description = "服务网络的CIDR块。它不能与VPC CIDR相同，不能与VPC中的Kubernetes集群使用的CIDR相同，也不能在创建后进行修改"
}

variable "k8s_worker_disk_size" {
    default = 40
    description = "节点的数据磁盘大小。有效值范围[20〜32768]，以GB为单位。当worker_data_disk_category被呈现，则默认为40"
}

variable "iac_nginx_replicas" {
    default = 1
    description = "副本数量"
}

variable "iac_consul_replicas" {
    default = 1
    description = "副本数量"
}

variable "iac_mysql_replicas" {
    default = 1
    description = "副本数量"
}

variable "iac_portal_replicas" {
    default = 1
    description = "副本数量"
}

variable "iac_runner_replicas" {
    default = 1
    description = "副本数量"
}
