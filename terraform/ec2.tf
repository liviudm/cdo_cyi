module "esmaster" {
    source = "./ec2"

    number_of_instances = 3

    ami_id = "${var.esmaster_ami_id}"
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"
    instance_type = "t2.medium"
    sgs = "${aws_security_group.ssh.id},${aws_security_group.elasticsearch.id},${aws_security_group.outgoing.id}"
    instance_name = "esmaster"
    iam_instance_profile = "${aws_iam_instance_profile.elasticsearch.name}"
    user_data = "files/user-data/esmaster.cfg"
}

module "esdata" {
    source = "./ec2"

    number_of_instances = 2

    ami_id = "${var.esdata_ami_id}"
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"
    instance_type = "t2.medium"
    sgs = "${aws_security_group.ssh.id},${aws_security_group.elasticsearch.id},${aws_security_group.outgoing.id}"
    instance_name = "esdata"
    iam_instance_profile = "${aws_iam_instance_profile.elasticsearch.name}"
    user_data = "files/user-data/esdata.cfg"
    root_volume_size = 80
}

module "kibana" {
    source = "./ec2"

    ami_id = "${var.kibana_ami_id}"
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"
    instance_type = "t2.medium"
    sgs = "${aws_security_group.ssh.id},${aws_security_group.elasticsearch.id},${aws_security_group.kibana.id},${aws_security_group.outgoing.id}"
    instance_name = "kibana"
    iam_instance_profile = "${aws_iam_instance_profile.elasticsearch.name}"
    user_data = "files/user-data/kibana.cfg"
}
