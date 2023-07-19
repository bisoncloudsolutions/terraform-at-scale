# Infrastructure Repository
This repo contains the Terragrunt and project specific modules. Common modules may be imported from other repositories.

This project is setup such that the target environment config file gets renamed to "config.hcl". For example, if running against development environment, rename "development-config.hcl" to "config.hcl".

## Sample CI Script:
```
echo "--- TERRAFORM PLAN ---"
cp $IAC_CONFIG config.hcl
sed -i "s/{{token_name}}/git-ci-token/g" config.hcl
sed -i "s/{{token_value}}/${token_value}/g" config.hcl
terragrunt run-all init --terragrunt-non-interactive
terragrunt run-all plan --terragrunt-non-interactive
```
