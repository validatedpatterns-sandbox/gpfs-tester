# GPFS Tester

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Special Notes

Note that this pattern expects to be deployed on metal-capable nodes to begin with (i.e. m5.metal, cn5.metal, etc).

Note also that this pattern *MUST* be deployed in a single AZ, because it depends on attaching volumes to workers
for use by IBM Fusion SAN storage, and AWS volumes will not attach to nodes not in the same AZ.

By default, "make install" assumes an AWS install on metal workers. "make baremetalinstall" will skip the AWS
specific prep phases (adding security groups, AWS IAM settings, provisioning and attaching EBS volumes for GPFS
to use). Note that you must still provide a default storage class (for Vault).

## Start Here

If you've followed a link to this repository, but are not really sure what it contains
or how to use it, head over to [Validated Patterns](https://validatedpatterns.io)
for additional context and installation instructions
