###########################################################################
################## DEFINIÇÃO DE TIPOS DE VARIÁVEIS GERAIS #################
###########################################################################

variable "datacenter" {
  description = "Nome do datacenter"
  type        = string
}
variable "cluster" {
  description = "Nome Cluster"
  type        = string
}
variable "datastore_cluster" {
  description = "Cluster de Datastore"
  type        = string
}
variable "network" {
  description = "Nome da interface de rede"
  type        = string
}
variable "dns_server_list" {
  description = "Quais IPs serão inseridos como DNS nas VMs"
  type        = list(string)
}
variable "cpu_hot_add_enabled" {
  description = "Inserir mais CPU com máquina ligada"
  type        = bool
}
variable "memory_hot_add_enabled" {
  description = "Inserir mais RAM com máquina ligada"
  type        = bool
}
variable "template" {
  description = "Nome do Template"
  type        = string
}

###########################################################################
################ DEFINIÇÃO DE TIPOS DE VARIÁVEIS DE PASTAS ################
###########################################################################

variable "folderdevback" {
  description = "Pasta que ficarão as VMs Nodes Back"
  type        = string
}

variable "folderdevfront" {
  description = "Pasta que ficarão as VMs Nodes Front"
  type        = string
}

variable "folderdevpatroni" {
  description = "Pasta que ficarão as VMs Patroni"
  type        = string
}

variable "folderdevnginx" {
  description = "Pasta que ficarão as VMs Nginx"
  type        = string
}

variable "folderdevrabbitmq" {
  description = "Pasta que ficarão as VMs Rabbit"
  type        = string
}

variable "folderdevredis" {
  description = "Pasta que ficarão as VMs Redis"
  type        = string
}

variable "folderdevactivemq" {
  description = "Pasta que ficarão as VMs ActiveMQ"
  type        = string
}

variable "folderdevmongododp" {
  description = "Pasta que ficarão as VMs Mongo DODP"
  type        = string
}

variable "folderdevmongofile" {
  description = "Pasta que ficarão as VMs Mongo File"
  type        = string
}

variable "folderdevprocapi" {
  description = "Pasta que ficarão as VMs Procapi"
  type        = string
}

variable "folderdevad" {
  description = "Pasta que ficarão as VMs AD"
  type        = string
}

###########################################################################
############### DEFINIÇÃO DE TIPO DE VARIÁVEIS DOS MÓDULOS ################
###########################################################################

###### MÓDULO NGINX
variable "ram_size_nginx" {
  description = "Tamanho da RAM dos nodes nginx"
  type        = number
}
variable "cpu_number_nginx" {
  description = "Quantidade de CPUs nodes nginx"
  type        = number
}
variable "disk_size_gb_nginx" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO BACK
variable "ram_size_back" {
  description = "Tamanho da RAM dos nodes Back"
  type        = number
}
variable "cpu_number_back" {
  description = "Quantidade de CPUs nodes Back"
  type        = number
}
variable "disk_size_gb_back" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO FRONT
variable "ram_size_front" {
  description = "Tamanho da RAM dos nodes Front"
  type        = number
}
variable "cpu_number_front" {
  description = "Quantidade de CPUs dos nodes Front"
  type        = number
}
variable "disk_size_gb_front" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO ACTIVEMQ
variable "ram_size_activemq" {
  description = "Tamanho da RAM dos nodes Back"
  type        = number
}
variable "cpu_number_activemq" {
  description = "Quantidade de CPUs nodes Back"
  type        = number
}
variable "disk_size_gb_activemq" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO PATRONI
variable "ram_size_patroni" {
  description = "Tamanho da RAM dos nodes Patroni"
  type        = number
}
variable "cpu_number_patroni" {
  description = "Quantidade de CPUs nodes Patroni"
  type        = number
}
variable "disk_size_gb_patroni" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO MONGO DODP
variable "ram_size_mongo_dodp" {
  description = "Tamanho da RAM dos nodes Mongo DODP"
  type        = number
}
variable "cpu_number_mongo_dodp" {
  description = "Quantidade de CPUs nodes Mongo DODP"
  type        = number
}
variable "disk_size_gb_mongo_dodp" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO MONGO FILE
variable "ram_size_mongo_file" {
  description = "Tamanho da RAM dos nodes Mongo DODP"
  type        = number
}
variable "cpu_number_mongo_file" {
  description = "Quantidade de CPUs nodes Mongo DODP"
  type        = number
}
variable "disk_size_gb_mongo_file" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO RABBITMQ
variable "ram_size_rabbitmq" {
  description = "Tamanho da RAM dos nodes Mongo DODP"
  type        = number
}
variable "cpu_number_rabbitmq" {
  description = "Quantidade de CPUs nodes Mongo DODP"
  type        = number
}
variable "disk_size_gb_rabbitmq" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO REDIS
variable "ram_size_redis" {
  description = "Tamanho da RAM dos nodes Mongo DODP"
  type        = number
}
variable "cpu_number_redis" {
  description = "Quantidade de CPUs nodes Mongo DODP"
  type        = number
}
variable "disk_size_gb_redis" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO PROCAPI
variable "ram_size_procapi" {
  description = "Tamanho da RAM dos nodes Mongo DODP"
  type        = number
}
variable "cpu_number_procapi" {
  description = "Quantidade de CPUs nodes Mongo DODP"
  type        = number
}
variable "disk_size_gb_procapi" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}

###### MÓDULO ACTIVE DIRECTORY
variable "ram_size_ad" {
  description = "Tamanho da RAM dos nodes AD"
  type        = number
}
variable "cpu_number_ad" {
  description = "Quantidade de CPUs nodes AD"
  type        = number
}
variable "disk_size_gb_ad" {
  description = "Tamanho HD. Informe 80 ou 240"
  type        = string
}
variable "templatead" {
  description = "Nome do Template"
  type        = string
}

#--------------------------------------------------------------------------
###########################################################################
##################### DEFINIÇÃO DOS DATAS RESOURCES #######################
###########################################################################

###### Datacenter
data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}
###### Cluster
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
# ###### Datastore Cluster
data "vsphere_datastore_cluster" "datastore_cluster" {
  name          = var.datastore_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
###### NETWORK
data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
###### TEMPLATE
data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

