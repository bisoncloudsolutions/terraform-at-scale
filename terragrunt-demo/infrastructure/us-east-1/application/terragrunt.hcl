locals {
    config = read_terragrunt_config(find_in_parent_folders("config.hcl"))
    app = local.config.locals.modules.project.application

    region = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

terraform {
    source = "./tf"
}

include {
    path = find_in_parent_folders()
}

generate = local.region.generate

inputs = {
    aws_account_id = local.config.locals.aws_account_id
    vpc_id = local.app.vpc_id
    sg_name = local.app.sg_name
    public_subnet_id_a = local.app.public_subnet_id_a
    public_subnet_id_b = local.app.public_subnet_id_b
    public_subnet_id_c = local.app.public_subnet_id_c
    autoscaler_instance_type = local.app.autoscaler_instance_type
    desired_capacity = local.app.desired_capacity
    max_size = local.app.max_size
    min_size = local.app.min_size
}
