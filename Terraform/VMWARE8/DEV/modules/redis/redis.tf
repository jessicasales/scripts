########################## REDIS ##########################

resource "vsphere_virtual_machine" "dev-redis" {
count                   = 1
name                    = "dev-redis-100-10-${32 + count.index}"
resource_pool_id        = data.vsphere_compute_cluster.cluster.resource_pool_id
folder                  = var.folderdevredis
datastore_cluster_id    = data.vsphere_datastore_cluster.datastore_cluster.id
num_cpus                = var.cpu_number_redis
memory                  = var.ram_size_redis
guest_id                = data.vsphere_virtual_machine.template.guest_id
scsi_type               = data.vsphere_virtual_machine.template.scsi_type 
cpu_hot_add_enabled     = true
memory_hot_add_enabled  = true
firmware = "efi"
#wait_for_guest_net_timeout = 0

  disk {
    label            = "disk0"
    size             = var.disk_size_gb_redis
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

 clone {
    template_uuid = data.vsphere_virtual_machine.template.id
     customize {
       linux_options {
         host_name = "dev-redis-100-10-${32 + count.index}"
         domain    = "group.local"
       }
       network_interface {
         ipv4_address = "10.100.10.${32 + count.index}"
         ipv4_netmask = 24
       }

       ipv4_gateway = "10.100.10.11"
       dns_server_list = ["10.100.0.180", "10.100.0.181"]
     }
    } 
}


