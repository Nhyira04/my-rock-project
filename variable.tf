variable "vpc-cidr" {
  type        = string
  description = "name of vpc-cidr"
  default     = "10.0.0.0/16"

}

variable "public-cidr1" {
  type        = string
  description = "name of public-cidr"
  default     = "10.0.1.0/24"

}

variable "public-cidr2" {
  type         = string
  description  = "name of public-cidr"
  default = "10.0.2.0/24"

}

variable "private-cidr1" {
  type        = string
  description = "name of private-cidr"
  default     = "10.0.3.0/24"

}

variable "private-cidr2" {
  type        = string
  description = "name of private-cidr"
  default     = "10.0.4.0/24"

}

/*variable "igw-cidr" {
  type        = string
  description = "name of igw-cidr"
  default     = "0.0.0.0/0"

}*/

variable "abz-1" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2a"
}

variable "abz-2" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2b"
}

variable "abz-3" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2c"
}

variable "abz-4" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2a"
}

variable "region-name" {
  type        = string
  description = "name of region"
  default     = "eu-west-2"
}