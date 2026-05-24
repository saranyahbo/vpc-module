

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enabling dns hosts boolean value"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "enabling dns support boolean value"
  default     = true
}

variable "enable_network_address_usage_metrics" {
  type        = bool
  description = "enable_network_address_usage_metrics boolean value"
  default     = ture
}

variable "routable_subnet-1" {
  type        = string
  description = "cidr_range for routable subnet"
  default     = "10.0.1.0/24"
}

variable "routable_subnet-2" {
  type        = string
  description = "cidr_range for routable subnet"
  default     = "10.0.2.0/24"
}

variable "routable_subnet-3" {
  type        = string
  description = "cidr_range for routable subnet"
  default     = "10.0.3.0/24"
}


variable "non-routable_subnet-1" {
  type        = string
  description = "cidr_range for non-routable subnet"
  default     = "10.0.11.0/24"
}

variable "non-routable_subnet-2" {
  type        = string
  description = "cidr_range for non-routable subnet"
  default     = "10.0.12.0/24"
}

variable "non-routable_subnet-3" {
  type        = string
  description = "cidr_range for non-routable subnet"
  default     = "10.0.13.0/24"
}

variable "igw_routable_cidr_id" {
  type        = string
  description = "igw cidr range"
  default     = "0.0.0.0/0"
}

variable "non-routable_cidr-route" {
  type        = string
  description = "cidr_range for non-routable route table"
  default     = "0.0.0.0/0"
}
