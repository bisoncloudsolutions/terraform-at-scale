locals {
    aws_account_id = "912345678901"
    aws_account_name = "project-production-account"
    environment = "production"
    environment_short = "prod"

    modules = {
        project = {
            application = {
                vpc_id = "vpc-0f0f0f0f0f0f0f0f0"
                sg_name = "project"
                public_subnet_id_a = "subnet-0a0a0a0a0a0a0a0a0"
                public_subnet_id_b = "subnet-0b0b0b0b0b0b0b0b0"
                public_subnet_id_c = "subnet-0c0c0c0c0c0c0c0c0"
                autoscaler_instance_type = "r6g.2xlarge"
                desired_capacity = 6
                max_size = 12
                min_size = 3
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
