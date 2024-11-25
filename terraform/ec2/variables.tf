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

variable "infra_key_name" {
  default     = "pej-infra"
  description = "Key pair name for pej-infra SSH access"
}

variable "public_subnet_id" {
  description = "Subnet ID for public subnet where pej-infra will be created"
}

variable "public_subnet_ip" {
  description = "Subnet IP for public subnet where pej-infra will be created"
}

variable "private_subnet_ip" {
  description = "Subnet IP for private subnet where pej-infra will be created"
}

variable "jump_key_name" {
  default     = "pej-jump"
  description = "Key pair name for pej-jump SSH access"
}

variable "zabbix_key_name" {
  default     = "pej-zabbix"
  description = "Key pair name for pej-zabbix SSH access"
}

variable "wazuh_key_name" {
  default     = "pej-wazuh"
  description = "Key pair name for pej-wazuh SSH access"
}