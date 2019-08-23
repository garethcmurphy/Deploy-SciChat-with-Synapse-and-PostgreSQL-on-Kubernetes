#!/usr/bin/env bash
git pull
helm del --purge scichat
helm del --purge synapse

if [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    INGRESS_NAME="-f ./scichat/lund.yaml"
elif [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    INGRESS_NAME="-f ./scichat/dmscprod.yaml"
fi

helm install scichat --name scichat --namespace dev ${INGRESS_NAME}
helm install synapse --name synapse --namespace dev ${INGRESS_NAME}
