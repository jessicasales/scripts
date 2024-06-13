######################### PROVIDER ######################### 

provider "vsphere" {
  vsphere_server       = ""
  user                 = "" #INSIRA SEU USER DO VMWARE AQUI
  password             = "" #INSIRA SUA SENHA DO VMWARE AQUI
  allow_unverified_ssl = true
}

######################### MÓDULOS #########################

#CHAMADA DO ACTIVEMQ
module "activemq" {
  source                = "./modules/activemq"
  template              = var.template
  cluster               = var.cluster
  datacenter            = var.datacenter
  network               = var.network
  folderdevactivemq     = var.folderdevactivemq
  datastore_cluster     = var.datastore_cluster
  cpu_number_activemq   = var.cpu_number_activemq
  ram_size_activemq     = var.ram_size_activemq
  disk_size_gb_activemq = var.disk_size_gb_activemq
}

#CHAMADA DO ACTIVEDIRECTORY
module "activedirectory" {
  source            = "./modules/activedirectory"
  templatead        = var.templatead
  cluster           = var.cluster
  datacenter        = var.datacenter
  network           = var.network
  folderdevad       = var.folderdevad
  datastore_cluster = var.datastore_cluster
  cpu_number_ad     = var.cpu_number_ad
  ram_size_ad       = var.ram_size_ad
  disk_size_gb_ad   = var.disk_size_gb_ad
}

#CHAMADA DO BACK
module "back" {
  source            = "./modules/back"
  template          = var.template
  cluster           = var.cluster
  datacenter        = var.datacenter
  network           = var.network
  folderdevback     = var.folderdevback
  datastore_cluster = var.datastore_cluster
  cpu_number_back   = var.cpu_number_back
  ram_size_back     = var.ram_size_back
  disk_size_gb_back = var.disk_size_gb_back
}

#CHAMADA DO FRONT
module "front" {
  source             = "./modules/front"
  template           = var.template
  cluster            = var.cluster
  datacenter         = var.datacenter
  network            = var.network
  folderdevfront     = var.folderdevfront
  datastore_cluster  = var.datastore_cluster
  cpu_number_front   = var.cpu_number_front
  ram_size_front     = var.ram_size_front
  disk_size_gb_front = var.disk_size_gb_front
}

# #CHAMADA DO MONGO DODP
module "mongo-dodp" {
  source                  = "./modules/mongo-dodp"
  template                = var.template
  cluster                 = var.cluster
  datacenter              = var.datacenter
  network                 = var.network
  folderdevmongododp      = var.folderdevmongododp
  datastore_cluster       = var.datastore_cluster
  cpu_number_mongo_dodp   = var.cpu_number_mongo_dodp
  ram_size_mongo_dodp     = var.ram_size_mongo_dodp
  disk_size_gb_mongo_dodp = var.disk_size_gb_mongo_dodp
}

# #CHAMADA DO MONGO FILE
module "mongo-file" {
  source                  = "./modules/mongo-file"
  template                = var.template
  cluster                 = var.cluster
  datacenter              = var.datacenter
  network                 = var.network
  folderdevmongofile      = var.folderdevmongofile
  datastore_cluster       = var.datastore_cluster
  cpu_number_mongo_file   = var.cpu_number_mongo_file
  ram_size_mongo_file     = var.ram_size_mongo_file
  disk_size_gb_mongo_file = var.disk_size_gb_mongo_file
}

# #CHAMADA DO NGINX
module "nginx" {
  source             = "./modules/nginx"
  template           = var.template
  cluster            = var.cluster
  datacenter         = var.datacenter
  network            = var.network
  folderdevnginx     = var.folderdevnginx
  datastore_cluster  = var.datastore_cluster
  cpu_number_nginx   = var.cpu_number_nginx
  ram_size_nginx     = var.ram_size_nginx
  disk_size_gb_nginx = var.disk_size_gb_nginx
}

# #CHAMADA DO PATRONI
module "patroni" {
  source               = "./modules/patroni"
  template             = var.template
  cluster              = var.cluster
  datacenter           = var.datacenter
  network              = var.network
  folderdevpatroni     = var.folderdevpatroni
  datastore_cluster    = var.datastore_cluster
  cpu_number_patroni   = var.cpu_number_patroni
  ram_size_patroni     = var.ram_size_patroni
  disk_size_gb_patroni = var.disk_size_gb_patroni
}

# #CHAMADA DO RABBITMQ
module "rabbitmq" {
  source                = "./modules/rabbitmq"
  template              = var.template
  cluster               = var.cluster
  datacenter            = var.datacenter
  network               = var.network
  folderdevrabbitmq     = var.folderdevrabbitmq
  datastore_cluster     = var.datastore_cluster
  cpu_number_rabbitmq   = var.cpu_number_rabbitmq
  ram_size_rabbitmq     = var.ram_size_rabbitmq
  disk_size_gb_rabbitmq = var.disk_size_gb_rabbitmq
}

# #CHAMADA DO REDIS
module "redis" {
  source             = "./modules/redis"
  template           = var.template
  cluster            = var.cluster
  datacenter         = var.datacenter
  network            = var.network
  folderdevredis     = var.folderdevredis
  datastore_cluster  = var.datastore_cluster
  cpu_number_redis   = var.cpu_number_redis
  ram_size_redis     = var.ram_size_redis
  disk_size_gb_redis = var.disk_size_gb_redis
}

# #CHAMADA DO PROCAPI
module "procapi" {
  source               = "./modules/procapi"
  template             = var.template
  cluster              = var.cluster
  datacenter           = var.datacenter
  network              = var.network
  folderdevprocapi     = var.folderdevprocapi
  datastore_cluster    = var.datastore_cluster
  cpu_number_procapi   = var.cpu_number_procapi
  ram_size_procapi     = var.ram_size_procapi
  disk_size_gb_procapi = var.disk_size_gb_procapi
}

