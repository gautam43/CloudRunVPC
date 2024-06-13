# GCP Cloud Run VPC Module

This module sets up a VPC with subnets and deploys a Cloud Run service on Google Cloud Platform.

## Usage

```hcl
module "gcp_cloud_run_vpc" {
  source = "./cloud_run_vpc"

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
![image](https://github.com/gautam43/CloudRunVPC/assets/49231797/f88d66e9-37a0-4032-8881-0051ad39ec09)

## Deployment to Cloud Run service

* Create a file name main.tf outside the module and provide these inputs as shown above

| Name            | Description                                                                 | Type           | Default | Required |
|-----------------|-----------------------------------------------------------------------------|----------------|---------|----------|
| `project_id`    | The GCP project ID                                                          | `string`       | n/a     | yes      |
| `region`        | The GCP region                                                              | `string`       | n/a     | yes      |
| `vpc_name`      | The name of the VPC                                                         | `string`       | n/a     | yes      |
| `vpc_cidr`      | The CIDR block for the VPC                                                  | `string`       | n/a     | yes      |
| `subnet_cidrs`  | A list of CIDR blocks for the subnets                                       | `list(string)` | n/a     | yes      |
| `service_name`  | The name of the Cloud Run service                                           | `string`       | n/a     | yes      |
| `service_image` | The container image for the Cloud Run service                               | `string`       | n/a     | yes      |
| `service_memory`| The memory allocation for the Cloud Run service (e.g., 512Mi, 1Gi)          | `string`       | n/a     | yes      |

* Run the ```terraform plan``` and ```terraform apply``` command:

  ![image](https://github.com/gautam43/CloudRunVPC/assets/49231797/02de012d-a04f-490c-b853-668cf6e55a45)

  ![image](https://github.com/gautam43/CloudRunVPC/assets/49231797/e5bd3e72-544f-4548-bea1-fa4ce583c83e)

  ![image](https://github.com/gautam43/CloudRunVPC/assets/49231797/b7e3a3f4-c840-441a-a699-4ddc56d390fe)



