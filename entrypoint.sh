#!/usr/bin/env bash
set -e

# Login to Kubernetes Cluster.
aws eks \
    --region ${AWS_DEFAULT_REGION} \
    update-kubeconfig --name ${CLUSTER_NAME}

####################
# Helm uninstall
####################

UNINSTALL_COMMAND="helm uninstall ${DEPLOY_NAME} --timeout ${TIMEOUT} --wait"

if [ -n "$DEPLOY_NAMESPACE" ]; then
    UNINSTALL_COMMAND="${UNINSTALL_COMMAND} -n ${DEPLOY_NAMESPACE}"
fi
    
echo "Executing: ${UNINSTALL_COMMAND}"
${UNINSTALL_COMMAND}