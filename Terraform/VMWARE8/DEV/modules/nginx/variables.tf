#########################################################################
######################### VARIÁVEIS ESPECÍFICAS #########################
######################################################################### 

variable "folderdevnginx" {
  description = "Pasta que ficarão as VMs Nodes nginx"
  type = string
}

variable "cpu_number_nginx" {
  description = "Quantidade de CPUs dos nodes nginx"
  type = number
}

variable "ram_size_nginx" {
  description = "Tamanho da RAM dos nodes nginx"
  type = number
}

variable "disk_size_gb_nginx" {
  description = "Tamanho HD dos nodes nginx"
  type = string
}

######################################################################
########################## VARIÁVEIS GERAIS ########################## 
###################################################################### 

variable "template" {
  description = "Nome do Template"
  type = string
}

 variable "datacenter" {
   description = "Nome do datacenter"
   type = string
 }
 variable "cluster" {
   description = "Nome Cluster"
   type = string
 }
 variable "datastore_cluster" {
   description = "Cluster de Datastore"
   type = string
 }

 variable "network" {
   description = "Nome da interface de rede"
   type = string
 }

################################################################
############################# DATAS ############################
################################################################ 

 #Datacenter
  data "vsphere_datacenter" "datacenter" {
    name = var.datacenter
  }
 #Cluster
  data "vsphere_compute_cluster" "cluster" {
    name          = var.cluster 
    datacenter_id = data.vsphere_datacenter.datacenter.id
  }
 #Datastore Cluster
 data "vsphere_datastore_cluster" "datastore_cluster" {
   name          = var.datastore_cluster
   datacenter_id = data.vsphere_datacenter.datacenter.id
 }
 #NETWORK
 data "vsphere_network" "network" {
   name          = var.network
   datacenter_id = data.vsphere_datacenter.datacenter.id
 }
 #TEMPLATE
 data "vsphere_virtual_machine" "template" {
   name          = var.template
   datacenter_id = data.vsphere_datacenter.datacenter.id
 }

