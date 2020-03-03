#!/usr/bin/env bash

# This script destroys GCP VMs

DEFAULT_COUNT=1
VM_COUNT=${1:-$DEFAULT_COUNT}
STATE_PATH="../secrets/terraform.tfstate"
STATE_IN="-state=$STATE_PATH"
STATE_OUT="-state-out=$STATE_PATH"

# Destroy all terraform-managed resources
terraform destroy $STATE_IN $STATE_OUT \
	-var="vm_count=${VM_COUNT}" \
	-auto-approve \
	|| echo "Error while destroying instances."
