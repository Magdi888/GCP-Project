module "network" {
    source = "./network"
    region = var.region
    subnet1_cidr = var.subnet1_cidr
    subnet2_cidr = var.subnet2_cidr
    secondary_ip_range_restricted_1 = var.secondary_ip_range_restricted_1
    secondary_ip_range_restricted_2 = var.secondary_ip_range_restricted_2
    
}

module "gke" {
    source = "./K8s_module"
    project = var.project
    zone = var.zone
    network = module.network.vpc_network
    subnet = module.network.restricted_subnet_link
    pod_range = module.network.pods_range
    service_range = module.network.service_rang
    master_node_cidr = "10.0.3.0/28"
    authorized_networks = module.network.managed_subnet_cidr
    max_pods_per_node = 100
    node_machine_type = "e2-medium"
}