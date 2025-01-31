#!/bin/bash

# Read password
pass=$(<admin-pwd.txt)

# Substitute password
sed -e "s/{_PW_}/$pass/g" values.yaml > values_proxy.yaml

# Upgrade helm
helm upgrade prometheus-monitoring prometheus-community/kube-prometheus-stack --values values_proxy.yaml
