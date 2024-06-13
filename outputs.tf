output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc_network.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [for subnet in google_compute_subnetwork.subnet : subnet.id]
}

output "cloud_run_url" {
  description = "The URL of the Cloud Run service"
  value       = google_cloud_run_service.service.status[0].url
}
