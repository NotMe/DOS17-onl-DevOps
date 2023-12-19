variable "access_key" {}

variable "secret_key" {}

variable "machine_type" {
  type = string
  default = "t3.micro"
}

variable "zone" {
  type = string
  default = "eu-north-1"
}

variable "enable_public_ip" {
  type = bool
  default = true
}

//machine_type
//zone
//enable_public_ip
//image_family и image_project