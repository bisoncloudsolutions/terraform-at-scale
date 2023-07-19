data "aws_ami" "ec2_image" {
    most_recent = true
    owners = [var.aws_account_id]
    filter {
        name = "name"
        values = ["some-image-name*"]
    }
}

resource "aws_launch_configuration" "launch_config" {
    name_prefix = "project-configuration"
    image_id = data.aws_ami.ec2_image.id
    instance_type = var.autoscaler_instance_type
    security_groups = [aws_security_group.public_https.id]
    associate_public_ip_address = true
    key_name = "app_key"

    root_block_device {
        volume_size = "50"
        volume_type = "standard"
        encrypted = true
        delete_on_termination = true
    }
  
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "autoscaling_group" {
    desired_capacity = var.desired_capacity
    max_size = var.max_size
    min_size = var.min_size
    vpc_zone_identifier = [var.public_subnet_id_a, var.public_subnet_id_b, var.public_subnet_id_c]
    launch_configuration = aws_launch_configuration.launch_config.name
    
    lifecycle {
        create_before_destroy = true
    }
      
    instance_refresh {
        strategy = "Rolling"
        preferences {
            min_healthy_percentage = 50
            instance_warmup = 10
        }
    }

    tag {
        key = "Name"
        value = "Application-Server"
        propagate_at_launch = true
    }
}
