locals {
    aws_account_id = "012345678901"
    aws_account_name = "project-development-account"
    environment = "development"
    environment_short = "dev"

    modules = {
        project = {
            application = {
                vpc_id = "vpc-0f0f0f0f0f0f0f0f0"
                sg_name = "project"
                public_subnet_id_a = "subnet-0a0a0a0a0a0a0a0a0"
                public_subnet_id_b = "subnet-0b0b0b0b0b0b0b0b0"
                public_subnet_id_c = "subnet-0c0c0c0c0c0c0c0c0"
                autoscaler_instance_type = "r6g.large"
                desired_capacity = 1
                max_size = 2
                min_size = 1
            }
        }

        admin = {
            core = {
                url = "git::https://{{token_name}}:{{token_value}}@some-git-repo.com/project/core.git"
                version = "v1.0.0"
                module_path = "./module"
            }
        }
    }
}
