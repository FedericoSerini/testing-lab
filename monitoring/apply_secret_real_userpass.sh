#!/bin/bash

# Read and trim user and password
user=$(base64 < admin-user.txt | tr -d '\n')
pass=$(base64 < admin-pwd.txt | tr -d '\n')

# Substitute user and password
sed -e "s/temp/$user/g" -e "s/changeme/$pass/g" grafana_secret.yaml > grafana_secret_proxy.yaml

# Apply the secret
kubectl apply -f grafana_secret_proxy.yaml --namespace monitoring
