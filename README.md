terraform-yunji-cloud-iac
================================================================================

本 Module 用于在阿里云的K8s云服务中部署一套云霁cloud-inc应用

本 Module 将会创建以下资源:

* [阿里云专有网络vpc](https://www.terraform.io/docs/providers/alicloud/r/vpc.html)
* [阿里云云服务器ecs](https://www.terraform.io/docs/providers/alicloud/r/ecs.html)
* [阿里云云服务交换机](https://www.terraform.io/docs/providers/alicloud/r/vswitch.html)
* [阿里云slb负载均衡服务](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb)
* [阿里云Kubernetes托管版](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_managed_kubernetes)
* [云霁cloud-iac服务](*)


## 功能

本模块支持在k8s服务下部署的cloud-iac应用进行动态的扩缩容。

* 本模块可以重复多次部署不同集群规格。
* 一键快速部署cloud-iac 服务的前后端应用。
* 指定配置ecs节点数量，并可进行更改。


## Terraform 版本
本模块支持 terraform >= 0.12 以上版本。


## 注意事项

* 使用本module 请配置阿里云AccessKey 和 SecretKey 
* 部署前请在阿里云容器服务/docker官网 上传cloud-iac相关镜像


作者
-------
Created and maintained by Evan (github.com/xuxiaoahang2018)


