variable "aws_account_id" {
    description = "(Required) Account number for the AWS account."
}

variable "vpc_id" {
    description = "(Required) VPC id"
}

variable "sg_name" {
    description = "(Required) custom security group name"
}

variable "public_subnet_id_a" {
    description = "(Required) Subnet Id for resources."
}

variable "public_subnet_id_b" {
    description = "(Required) Subnet Id for resources."
}

variable "public_subnet_id_c" {
    description = "(Required) Subnet Id for resources."
}

variable "autoscaler_instance_type" {
    description = "(Required) Autoscaler instance type"
}

variable "desired_capacity" {
    description = "(Required) Autoscaler desired capacity"
}

variable "max_size" {
    description = "(Required) Autoscaler max size"
}

variable "min_size" {
    description = "(Required) Autoscaler min size"
}
