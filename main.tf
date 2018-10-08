variable "access_key" {}

variable "secret_key" {}

variable "region" {
  default = "us-east-2"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "random_id" "server" {
  byte_length = 8
}

resource "aws_instance" "server" {
  ami           = "ami-941a1ff1"
  instance_type = "t2.micro"

  tags {
    "Identity" = "test-web-srv"
    "Name"     = "${random_id.server.hex}"
  }
}
