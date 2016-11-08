#!/bin/bash
set -e

echo "=============================================================================================="
echo "Executing Terraform ...."
echo "=============================================================================================="

pcf_opsman_image_name=$(cat opsman-metadata/name)

export PATH=/opt/terraform/terraform:$PATH
echo $gcp_svc_acct_key > /tmp/svc-acct.json

/opt/terraform/terraform plan \
  -var "gcp_proj_id=$gcp_proj_id" \
  -var "gcp_region=$gcp_region" \
  -var "gcp_terraform_prefix=$gcp_terraform_prefix" \
  gcp-concourse/terraform/$gcp_pcf_terraform_template/init
