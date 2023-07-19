locals {
    config = read_terragrunt_config("${get_parent_terragrunt_dir()}/config.hcl")
}

remote_state {
    backend = "s3"
    config = {
        bucket = "bucket-name-${local.config.locals.environment_short}"
        key = "${local.config.locals.environment}/${path_relative_to_include()}/project-terraform.tfstate"
        dynamodb_table = "terraform-state-lock"
        region = "us-east-1"
        disable_bucket_update = true
    }

    generate = {
        path = "project-backend.tf"
        if_exists = "overwrite_terragrunt"
    }
}
