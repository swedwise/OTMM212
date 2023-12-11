#!/bin/bash

backup_dir="21.1_services"

# ---- DO NOT EDIT -------------------

namespace=$1

if [ "x${namespace}" == "x" ]; then
   echo "USAGE:  update_services.sh <namespace>"
   exit
fi

mkdir -p "${backup_dir}"

otmm_services=("media-management" "adaptivemedia" "dmts-service" "message-queue" "search" "search-replica" "streaming" "digitalhub" "supportmgr" "rma" "qds")

for svc in "${otmm_services[@]}"; do
   echo "updating service ${svc}"
   exists=$(kubectl get service -n ${namespace} | grep ${svc} | wc -l)
   if [ ${exists} -ne 0 ]; then
      kubectl get service ${svc} -n ${namespace} -o yaml > ${svc}.yaml
      # Copy the original configuration to backup folder
      # - these original service definitions will be used if rollback is required
      sed -i '/creationTimestamp/d' ${svc}.yaml
      sed -i '/uid/d' ${svc}.yaml
      sed -i '/resourceVersion/d' ${svc}.yaml
      cp ${svc}.yaml "${backup_dir}"

      # Update to clusterIP type
      sed -i 's/NodePort/ClusterIP/' ${svc}.yaml
      sed -i '/nodePort/d' ${svc}.yaml
      kubectl replace -f ${svc}.yaml -n ${namespace}
      rm ${svc}.yaml
   else
      echo "Service ${svc} is not defined."
   fi
done
