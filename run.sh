#!/bin/bash
export TF_VAR_aws_access_key=${Access_key}
export TF_VAR_aws_secret_key=${Secret_key}
cd terraform
terraform init
terraform plan
