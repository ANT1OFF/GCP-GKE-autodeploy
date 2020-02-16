#!/bin/bash


gcpauth() {
   echo ${GCP_SECRET} > secret.json
   gcloud auth activate-service-account --key-file secret.json
   gcloud config set project ${PROJECT}
}

deployCluster() {
  echo "TEST A $1";
}

deployService() {
  echo "TEST B $2";
}


# calls function passed as an argument. Case sensitive
"$@"

