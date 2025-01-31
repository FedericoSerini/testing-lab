#!/bin/bash

# Read and trim user and password
pass=$(<admin-pwd.txt)

# Substitute user and password
sed -e "s/{_PW_}/$pass/g" values.yaml > values_proxy.yaml

# Apply the secret
helm upgrade prometheus-monitoring prometheus-community/kube-prometheus-stack --values values_proxy.yaml
