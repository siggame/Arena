#!/usr/bin/env bash

# This script builds VMs

DEFAULT_COUNT=1
VM_COUNT=${1:-$DEFAULT_COUNT}
STATE_PATH="../secrets/terraform.tfstate"
STATE_IN="-state=$STATE_PATH"
STATE_OUT="-state-out=$STATE_PATH"

# Create the instances
terraform apply $STATE_IN $STATE_OUT \
	-var="vm_count=${VM_COUNT}" \
	-auto-approve \
	|| echo "Error while creating instances."