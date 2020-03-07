#!/usr/bin/env bash

# This script outputs the list of instance ip addresses to a file

STATE="../secrets/terraform.tfstate"
OUTPUT="../secrets/ip_addresses.json"
INV="../secrets/inventory"

# Puts a list of strings containing IP addresses in $OUTPUT
terraform output -state=$STATE -json ip_addresses > $OUTPUT

# Format $OUTPUT into valid ansible inventory format

echo "[workers]" > $INV

while IFS= read -n1 p;do
  if [[ "$p" =~ [0-9] ]] || [[ "$p" == "." ]]; then
     printf "$p" >> $INV
  fi

  if [[ $p == "," ]]; then
    printf "\n" >> $INV
  fi
done < "$OUTPUT"
