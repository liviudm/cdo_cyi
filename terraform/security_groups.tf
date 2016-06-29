resource "aws_security_group" "ssh" {
    name = "ssh"
    description = "Grants access to SSH"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ 
            "5.2.194.23/32" 
        ]
    }

    tags {
        Name = "ssh"
        TF_MANAGED = "True"
    }
}

resource "aws_security_group" "elasticsearch" {
    name = "elasticsearch"
    description = "Grants access to ElasticSearch"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 9200
        to_port = 9200
        protocol = "tcp"
        cidr_blocks = [
            "5.2.194.23/32"
        ]
        self = true
    }

    ingress {
        from_port = 9300
        to_port = 9400
        protocol = "tcp"
        self = true
    }

    tags {
        Name = "elasticsearch"
        TF_MANAGED = "True"
    }
}

resource "aws_security_group" "kibana" {
    name = "kibana"
    description = "Grants access to Kibana"
    vpc_id = "${var.vpc_id}"

    ingress {
        from_port = 5601
        to_port = 5601
        protocol = "tcp"
        cidr_blocks = [
            "5.2.194.23/32"
        ]
    }

    tags {
        Name = "kibana"
        TF_MANAGED = "True"
    }
}

resource "aws_security_group" "outgoing" {
    name = "outgoing"
    description = "Allow all outgoing traffic"
    vpc_id = "${var.vpc_id}"

     egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [ "0.0.0.0/0" ]
     }

     tags {
        Name = "outgoing"
        TF_MANAGED = "True"
     }
}
