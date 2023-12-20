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
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_instance" "my_server" {
  ami                         = data.aws_ami.latest_ami_amazon_2023.id
  instance_type               = var.machine_type
  associate_public_ip_address = var.enable_public_ip
  availability_zone           = var.zone[0]
  vpc_security_group_ids      = [aws_security_group.HW_35_SG.id]
  key_name                    = "aws_tms.notme"

  tags = {
    Name = "HW_35"
  }
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ami" "latest_ami_amazon_2023"{
  owners = [ "137112412989" ]
  most_recent = true
  filter {
    name = "name"
    values = [ "al2023-ami-2023.*-x86_64" ]
  }
}

resource "aws_security_group" "HW_35_SG" {
  name = "HW_35_SG"

  dynamic "ingress" {
    for_each = var.enable_public_ip == true ? [1] : []
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
    }
  }

  tags = {
    Name = "HW_35_SG"
  }
}
