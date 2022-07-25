output "vpc_network" {
    value = google_compute_network.vpc_network.self_link
}

output "managed_subnet" {
    value = google_compute_subnetwork.management-subnetwork
}

output "managed_subnet_cidr" {
    value = google_compute_subnetwork.management-subnetwork.ip_cidr_range
}

output "managed_subnet_link" {
    value = google_compute_subnetwork.management-subnetwork.self_link
}

output "restricted_subnet_link" {
    value = google_compute_subnetwork.restricted-subnetwork.self_link
}

output "managed_subnet_name" {
    value = google_compute_subnetwork.management-subnetwork.name
}

output "restricted_subnet_name" {
    value = google_compute_subnetwork.restricted-subnetwork.name
}

output "pods_range" {
    value = google_compute_subnetwork.restricted-subnetwork.secondary_ip_range.0.range_name
}

output "service_rang" {
    value = google_compute_subnetwork.restricted-subnetwork.secondary_ip_range.1.range_name
}

output "vpc_network_name" {
    value = google_compute_network.vpc_network.name
}