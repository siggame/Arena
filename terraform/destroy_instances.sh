#!/usr/bin/env bash

# This script destroys GCP VMs

DEFAULT_COUNT=1
VM_COUNT=${1:-$DEFAULT_COUNT}
STATE_PATH="../secrets/terraform.tfstate"

terraform destroy \
	-state=$STATE_PATH \
	-state-out=$STATE_PATH \
	-var="vm_count=${VM_COUNT}" \
	-auto-approve \
	|| echo "Error while destroying instances."

cd ..
