#!/bin/bash

gcpauth() {
    echo "${GCP_SECRET}" > secret.json
    gcloud auth activate-service-account --key-file secret.json
    gcloud config set project "${PROJECT}"
}

deployCluster() {
    gcpauth

    set +e  # turn off error-trapping
    gcloud deployment-manager deployments describe "${CLUSTER_NAME}";
    echo $? > cluster-present.txt
    set -e  # turn on error-trapping

    if [[ $(cat cluster-present.txt) -ne 0 ]]; then
        gcloud deployment-manager deployments create "${CLUSTER_NAME}" --config ./deployment/cluster.yaml;
        else
        gcloud deployment-manager deployments update "${CLUSTER_NAME}" --config ./deployment/cluster.yaml;
    fi
} 

deployService() {
  echo "TEST B $2";
}


# calls function passed as an argument verbatim. Case sensitive
"$@"

