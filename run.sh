#!/usr/bin/env bash

# This script will run all of Arena

# Tournament Variables
VM_COUNT=3

# Build infrastructure
cd terraform

terraform init

./build_instances.sh $VM_COUNT

./output_addresses.sh

cd ..

# Install dependencies

cd ansible

ansible-playbook pb.install_dependencies.yml

cd ..

# Run tournament

# Collect results

# Teardown infrastructure
cd terraform

# bash destroy_instances.sh $VM_COUNT
