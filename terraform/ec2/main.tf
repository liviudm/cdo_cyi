/* EC2 Instance Resource for Module */

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    user_data = "${file(var.user_data)}"
    iam_instance_profile = "${var.iam_instance_profile}"
    key_name = "${var.key_name}"

    vpc_security_group_ids = [
        "${split(",", var.sgs)}"
    ]

    root_block_device {
        volume_size = "${var.root_volume_size}"
        volume_type = "gp2"
    }

    tags {
        Name = "${var.instance_name}"
        InstanceId = "${count.index}"
        TF_MANAGED = "True"
    }
}
