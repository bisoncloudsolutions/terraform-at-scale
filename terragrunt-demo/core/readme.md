# Information about this module
This module contains core resources all AWS accounts are required to have. This folder "core" would be it's own repository.

## Testing
Use TFLint and InfraCost to analyze Terraform code. Always do code reviews!

## Branching
Use feature branching, have a main branch, then tag the main branch. Infrastructure repositories should always pull from tags (immutable from change) rather than branches.

Enforce rules on the repository protecting tags, even if the tag is broken. Tracking point in time changes is a very important capability in a large scale environment.

## Terragrunt Configuration
Show a template file of terragrunt configuration and describe usage.