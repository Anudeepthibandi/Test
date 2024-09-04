variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "medusa-cluster"
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "medusa-service"
}

variable "task_name" {
  description = "Name of the ECS task definition"
  type        = string
  default     = "medusa-task"
}


