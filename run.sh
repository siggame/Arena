#!/usr/bin/env bash

# This script will run all of Arena

# Tournament Variables
VM_COUNT=3

# Build infrastructure
cd terraform

terraform init

bash build_instances.sh $VM_COUNT

cd ..

# Install dependencies

# Run tournament

# Collect results

# Teardown infrastructure
cd terraform

bash destroy_instances.sh $VM_COUNT
