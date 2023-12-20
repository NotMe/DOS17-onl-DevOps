variable "access_key" {}

variable "secret_key" {}

variable "machine_type" {
  type    = string
  default = "t3.micro"
}

variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "zone" {
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "enable_public_ip" {
  type    = bool
  default = false
}
