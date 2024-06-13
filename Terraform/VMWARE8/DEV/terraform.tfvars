###########################################################################
######################### VALORES VARIÁVEIS GERAIS ########################
###########################################################################

datacenter             = "group-02"
cluster                = "CLUSTER8"
datastore_cluster      = "PURE"
dns_server_list        = ["10.100.0.180", "10.100.0.181"]
network                = "RD_547"
cpu_hot_add_enabled    = true
memory_hot_add_enabled = true
template               = "VM_MODELO_LINUX_28_11_23"
#template               = "VM_MODELO_LINUX_31_01_24"


#--------------------------------------------------------------------------
###########################################################################
######################## VALORES VARIÁVEIS MÓDULOS ########################
###########################################################################

####################### VALORES VARIÁVEIS ACTIVE MQ #######################

folderdevactivemq     = "/DEV/ActiveMQ"
ram_size_activemq     = 6000
cpu_number_activemq   = 4
disk_size_gb_activemq = 80

################### VALORES VARIÁVEIS ACTIVE DIRECTORY ####################

folderdevad     = "/DEV/ActiveDirectory"
ram_size_ad     = 12000
cpu_number_ad   = 16
disk_size_gb_ad = 80
templatead      = "VM_MODELO_WINSERVER_17_11_23"

######################### VALORES VARIÁVEIS BACK ##########################

folderdevback     = "/DEV/BackEnd"
ram_size_back     = 164000
cpu_number_back   = 32
disk_size_gb_back = 80

######################### VALORES VARIÁVEIS FRONT #########################

folderdevfront     = "/DEV/FrontEnd"
ram_size_front     = 16000
cpu_number_front   = 8
disk_size_gb_front = 80

###################### VALORES VARIÁVEIS MONGO DODP #######################

folderdevmongododp      = "/DEV/Banco de Dados"
ram_size_mongo_dodp     = 16000
cpu_number_mongo_dodp   = 16
disk_size_gb_mongo_dodp = 80

###################### VALORES VARIÁVEIS MONGO FILE #######################

folderdevmongofile      = "/DEV/Banco de Dados"
ram_size_mongo_file     = 16000
cpu_number_mongo_file   = 16
disk_size_gb_mongo_file = 80

######################## VALORES VARIÁVEIS NGINX ##########################

folderdevnginx     = "/DEV/Nginx"
ram_size_nginx     = 12000
cpu_number_nginx   = 8
disk_size_gb_nginx = 80

####################### VALORES VARIÁVEIS PATRONI #########################

folderdevpatroni     = "/DEV/Banco de Dados"
ram_size_patroni     = 32000
cpu_number_patroni   = 16
disk_size_gb_patroni = 80

######################## VALORES VARIÁVEIS RABBIT #########################

folderdevrabbitmq     = "/DEV/RabbitMQ"
ram_size_rabbitmq     = 8000
cpu_number_rabbitmq   = 4
disk_size_gb_rabbitmq = 80

######################### VALORES VARIÁVEIS REDIS #########################

folderdevredis     = "/DEV/Redis"
ram_size_redis     = 8000
cpu_number_redis   = 4
disk_size_gb_redis = 80

######################## VALORES VARIÁVEIS PROCAPI ########################

folderdevprocapi     = "/DEV/Procapi"
ram_size_procapi     = 16000
cpu_number_procapi   = 8
disk_size_gb_procapi = 80
