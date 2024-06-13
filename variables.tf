variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  validation {
    condition     = can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d+$", var.vpc_cidr))
    error_message = "The VPC CIDR is not a valid CIDR block"
  }
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
  validation {
    condition     = alltrue([for cidr in var.subnet_cidrs : can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+/\\d+$", cidr))])
    error_message = "One or more subnet CIDRs are not valid CIDR blocks"
  }
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "service_image" {
  description = "The container image for the Cloud Run service"
  type        = string
}

variable "service_memory" {
  description = "The memory allocation for the Cloud Run service (e.g., 512Mi, 1Gi)"
  type        = string
  validation {
    condition     = can(regex("^(\\d+(Mi|Gi))$", var.service_memory))
    error_message = "The service memory allocation is not valid (use Mi or Gi)"
  }
}
