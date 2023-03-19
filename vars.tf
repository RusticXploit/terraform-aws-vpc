variable "vpc_network" {
  type = map
  default = {
    "cidr" = "10.25.0.0/16"
  }
}

variable "vpc_subnet_cidr" {
  type = map
  default = {
    "public" = "10.25.0.0/24"
    "private" = "10.25.16.0/20"
  }
}

variable "offices_subnet_cidr" {
  type = map
  default = {
    "california" = "216.25.16.8/29"
  }
}

variable "ssh_allow" {
  type = list
  default = ["72.23.21.18/32"] 
}
