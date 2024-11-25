variable "ami" {
  default     = "ami-00cc7c7bbf6cd10b4"
  description = "AMI ID for the pej-db EC2 instance"
}

variable "instance_type" {
  default     = "t2.small"
  description = "Instance type for pej-db EC2"
}

variable "key_name" {
  default     = "pej-db"
  description = "Key pair name for SSH access"
}

variable "private_subnet_id" {
  description = "Subnet ID for the pej-db instance"
}

variable "vpc_id" {
  description = "VPC ID for the pej-db security group"
}

variable "app_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "CIDR block of the application subnet"
}