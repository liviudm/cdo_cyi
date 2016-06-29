resource "aws_iam_role" "elasticsearch" {
    name = "es_iam_role"
    assume_role_policy = "${file(\"files/policies/role.json\")}"
}

resource "aws_iam_role_policy" "elasticsearch" {
    name = "es_iam_policy"
    policy = "${file(\"files/policies/policy.json\")}"
    role = "${aws_iam_role.elasticsearch.id}"
}

resource "aws_iam_instance_profile" "elasticsearch" {
    name = "es_iam_profile"
    path = "/"
    roles = ["${aws_iam_role.elasticsearch.name}"]
}


