#!/bin/bash

backup_dir="21.1_services"

# ---------- DO NOT EDIT ----------------------
namespace=$1

if [ "x${namespace}" == "x" ]; then
   echo "USAGE:  restore_services.sh <namespace>"
   exit
fi

# To restore the services to their 20.4 status, use the 
# files created during the 'update_services' step.

otmm_services=("media-management" "adaptivemedia" "dmts-service" "message-queue" "search" "search-replica" "streaming" "digitalhub" "supportmgr" "rma" "qds")

for svc in "${otmm_services[@]}"; do
   echo "restoring service ${svc}"
   yaml_file="${backup_dir}/${svc}.yaml"
   if [ -f "${yaml_file}" ]; then
      kubectl replace -f ${yaml_file} -n ${namespace}
   else
      echo "Service (${svc}) backup is not defined."
   fi
done
