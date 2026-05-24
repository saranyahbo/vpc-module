

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}

variable "enable_dns_hostnames" {
  type        = bool
  description = ""
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = ""
  default     = true
}

variable "enable_network_address_usage_metrics" {
  type        = bool
  description = ""
  default     = ture
}

variable "routable_subnet-1" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}

variable "routable_subnet-2" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}

variable "routable_subnet-3" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}


variable "non-routable_subnet-1" {
  type        = string
  description = ""
  default     = ""
}

variable "non-routable_subnet-2" {
  type        = string
  description = ""
  default     = ""
}

variable "non-routable_subnet-3" {
  type        = string
  description = ""
  default     = ""
}

variable "igw_routable_cidr_id" {
  type        = string
  description = ""
  default     = ""
}

variable "non-routable_cidr-route-1" {
  type        = string
  description = ""
  default     = ""
}

variable "non-routable_cidr-route-2" {
  type        = string
  description = ""
  default     = ""
}

variable "non-routable_cidr-route-3" {
  type        = string
  description = ""
  default     = ""
}