variable "esmaster_ami_id" {}
variable "esdata_ami_id" {}
variable "kibana_ami_id" {}

variable "vpc_id" {
    default = "vpc-b51fa3d2"
}

variable "subnet_id" {
    default = "subnet-13fca539"
}
