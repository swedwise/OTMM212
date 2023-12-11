#!/bin/bash

namespace=$1
if [ "x${namespace}" = "x" ]; then
   echo "USAGE:  stop_otds_pods <namespace>"
   exit
fi

deployments=("otdsws" "rabbitmq")
statefulsets=("opendj")

# Stop all OTMM deployments
for deploy in "${deployments[@]}"; do
   exists=$(kubectl get deploy -n ${namespace} | grep ${deploy} | wc -l)
   if [ $exists -ne 0 ]; then
     kubectl scale deploy ${deploy} --replicas=0 -n ${namespace}
   fi
done

# Stop all OTMM statefulsets
for sts in "${statefulsets[@]}"; do
   exists=$(kubectl get sts -n ${namespace} | grep ${sts} | wc -l)
   if [ $exists -ne 0 ]; then
     kubectl scale sts ${sts} --replicas=0 -n ${namespace}
   fi
done

