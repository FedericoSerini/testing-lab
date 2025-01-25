#!/bin/bash
helm repo add homarr-labs https://homarr-labs.github.io/charts/

helm repo update

helm install homarr homarr-labs/homarr --namespace homarr --create-namespace --set env.SECRET_ENCRYPTION_KEY='0865afaca68b245f2dadccdec87cec49ede1815d046eca046cdfbc15632882ca'

secret=$(<secret.txt)

# Ephimeral !
kubectl create secret generic db-secret \
--from-literal=db-encryption-key="$secret" \
--namespace homarr
