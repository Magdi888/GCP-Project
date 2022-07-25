variable "zone" {
    type = string
}

variable "network" {
    type = string
}

variable "subnet" {
    type = string
}

variable "pod_range" {
    type = string
}

variable "service_range" {
    type = string
}

variable "master_node_cidr" {
    type = string
}

variable "authorized_networks" {
    type = string
}

variable "project" {
    type = string
}


variable "max_pods_per_node" {
    type = number
}

variable "node_machine_type" {
    type = string
}