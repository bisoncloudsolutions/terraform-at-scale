locals {
    config = read_terragrunt_config(find_in_parent_folders("config.hcl"))
    app = local.config.locals.modules.admin.core

    url = local.app.url
    version = local.app.version
    module_path = local.app.module_path

    region = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

terraform {
    source = "${local.url}//${local.module_path}?ref=${local.version}"
}

include {
    path = find_in_parent_folders()
}

generate = local.region.generate

inputs = {
    aws_account_id = local.config.locals.aws_account_id
    aws_account_name = local.config.locals.aws_account_name
}
