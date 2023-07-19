data "aws_ec2_managed_prefix_list" "cloudfront" {
    name = "com.amazonaws.global.cloudfront.origin-facing"
}

resource "aws_security_group" "public_https" {
    name = "${var.sg_name}-public-https"
    vpc_id = var.vpc_id

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        prefix_list_ids = [data.aws_ec2_managed_prefix_list.cloudfront.id]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        prefix_list_ids = [data.aws_ec2_managed_prefix_list.cloudfront.id]
    }
}
