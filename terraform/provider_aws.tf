provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.aws_region}"
}

resource "terraform_remote_state" "cluj_devops" {
    backend = "s3"
    config {
        bucket = "cluj-devops-meetup"
        key = "terraform/terraform.tfstate"
        region = "us-east-1"
    }
}

variable "aws_region" {
    description = "AWS Region to launch resources"
    default = "us-east-1"
}

variable "access_key" {}
variable "secret_key" {}

variable "key_name" {
    description = "Name of the master AWS key pair"
    default = "Liviu"
}

variable "key_path" {
    description = "Path to private key of key pair"
    default = "~/.ssh/liviu-aws.pem"
}
