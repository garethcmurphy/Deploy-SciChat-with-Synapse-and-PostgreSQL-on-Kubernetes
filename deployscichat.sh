#!/usr/bin/env bash
if [[ -z "${POSTGRES_PASSWORD}" ]]; then
    MY_POSTGRES="synapse"
else
    MY_POSTGRES="${POSTGRES_PASSWORD}"
fi
echo "mypostgres" ${MY_POSTGRES}
git pull
helm del --purge scichat
#helm del --purge synapse
#helm del --purge local-postgresql

if [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    INGRESS_NAME="-f ./scichat/lund.yaml"
    elif [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    INGRESS_NAME="-f ./scichat/dmscprod.yaml"
fi

#helm install  --namespace dev --name local-postgresql --set postgresqlPassword=${MY_POSTGRES},postgresqlDatabase=synapse stable/postgresql
helm install scichat --name scichat --namespace dev ${INGRESS_NAME}
#helm install synapse --name synapse --namespace dev ${INGRESS_NAME}
