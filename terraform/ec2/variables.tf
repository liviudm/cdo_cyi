/* Module specific variables */

variable "instance_name" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "ami_id" {}
variable "user_data" {}
variable "iam_instance_profile" {}
variable "sgs" {}
variable "key_name" {}

variable "number_of_instances" {
  description = "Number of instances to start"
  default = 1
}

variable "root_volume_size" {
    description = "Size of the root volume"
    default = 8
}


