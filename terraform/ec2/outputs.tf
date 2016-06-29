/* Output the ID of the EC2 instance created */
output "ec2_instance_id" {
    value = "${aws_instance.ec2_instance.id}"
}

output "ec2_private_ip" {
    value = "${aws_instance.ec2_instance.private_ip}"
}

output "ec2_public_ip" {
    value = "${aws_instance.ec2_instance.public_ip}"
}

output "instance_zone" {
    value = "${aws_instance.ec2_instance.availability_zone}"
}
