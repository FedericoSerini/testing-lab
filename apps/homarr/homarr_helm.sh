#!/bin/bash
helm repo add homarr-labs https://homarr-labs.github.io/charts/

helm repo update

helm install homarr homarr-labs/homarr --namespace homarr --create-namespace

secret=$(<secret.txt)

# Ephemeral !
kubectl create secret generic db-secret \
--from-literal=db-encryption-key="$secret" \
--namespace homarr
