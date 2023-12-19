terraform {
  backend "s3" {
    bucket = "tms-dos17-onl"
    key    = "terraform"
    region = "eu-north-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region  = "${var.zone}"
}

resource "aws_instance" "my_server" {
  ami           = "ami-067f3514568fd5760"
  instance_type = "${var.machine_type}"
  associate_public_ip_address = "${var.enable_public_ip}"
//  vpc_security_group_ids = [aws_security_group.my_server.id]

  tags = {
    Name = "HW_35"
  }
}

/*resource "aws_security_group" "my_server" {
  name = "My security group"

  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0"]
    }

  data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}
ingress {
  from_port = 5432
  to_port = 5432
  protocol = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
}  
  }
}*/