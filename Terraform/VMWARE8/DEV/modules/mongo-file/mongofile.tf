########################## NODES mongo-file ##########################
resource "vsphere_virtual_machine" "dev-mongo-file" {
count                   = 3
name                    = "dev-mongo-file-100-10-${23 + count.index}"
resource_pool_id        = data.vsphere_compute_cluster.cluster.resource_pool_id
folder                  = var.folderdevmongofile
datastore_cluster_id    = data.vsphere_datastore_cluster.datastore_cluster.id
num_cpus                = var.cpu_number_mongo_file
memory                  = var.ram_size_mongo_file
guest_id                = data.vsphere_virtual_machine.template.guest_id
scsi_type               = data.vsphere_virtual_machine.template.scsi_type 
cpu_hot_add_enabled     = true
memory_hot_add_enabled  = true
firmware = "efi"
#wait_for_guest_net_timeout = 0
  
network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

 disk {
    label            = "disk0"
    unit_number      = 0 
    size             = var.disk_size_gb_mongo_file
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

 disk {
    label            = "disk1"
    unit_number      = 1 
    size             = 160
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  
clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "dev-mongo-file-100-10-${23 + count.index}"
        domain    = "group.local"
      }
      network_interface {
        ipv4_address = "10.100.10.${23 + count.index}"
        ipv4_netmask = 24
      }
      ipv4_gateway = "10.100.10.11"
      dns_server_list = ["10.100.0.180", "10.100.0.181"]
    }
  }
}

