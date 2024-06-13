# GCP Cloud Run VPC Module

This module sets up a VPC with subnets and deploys a Cloud Run service on Google Cloud Platform.

## Usage

```hcl
module "gcp_cloud_run_vpc" {
  source = "./gcp_cloud_run_vpc"

  project_id      = "your-project-id"
  region          = "us-central1"
  vpc_name        = "my-vpc"
  vpc_cidr        = "10.0.0.0/16"
  subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
  service_name    = "my-cloud-run-service"
  service_image   = "your-region-docker.pkg.dev/your-project-id/repository_name/your-image:latest"
  service_memory  = "512Mi"
}

output "vpc_id" {
  value = module.gcp_cloud_run_vpc.vpc_id
}

output "subnet_ids" {
  value = module.gcp_cloud_run_vpc.subnet_ids
}

output "cloud_run_url" {
  value = module.gcp_cloud_run_vpc.cloud_run_url
}
```
