# Encrypt EBS by default
data "aws_ebs_encryption_by_default" "current" {}

# Block S3 Public buckets by default
resource "aws_s3_account_public_access_block" "example" {
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

# IAM Password Policy
resource "aws_iam_account_password_policy" "default" {
    require_lowercase_characters = true
    require_numbers = true
    require_uppercase_characters = true
    require_symbols = true
    allow_users_to_change_password = true
    
    minimum_password_length = 12
    password_reuse_prevention = 24
    max_password_age = 90
}