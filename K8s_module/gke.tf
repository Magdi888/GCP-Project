resource "google_container_cluster" "private_gke" {
    name     = "my-gke-cluster"
    location = var.zone
    network = var.network
    subnetwork = var.subnet
  
    remove_default_node_pool = true
    initial_node_count   = 1
    networking_mode = "VPC_NATIVE"
    ip_allocation_policy {
        cluster_secondary_range_name  = var.pod_range
        services_secondary_range_name = var.service_range
    }
    private_cluster_config {
        enable_private_endpoint = true
        enable_private_nodes    = true
        master_ipv4_cidr_block  = var.master_node_cidr  
    }
        
    master_authorized_networks_config {
        cidr_blocks {
            cidr_block= var.authorized_networks
            display_name = "managed-network"

        }
    }
    network_policy {
      enabled = true
    }


    addons_config {
      network_policy_config {
        disabled = false
      }
    }



}