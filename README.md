# GCK-autodeploy

## Setup
```
gcloud auth login
gcloud config set project name-of-project
```

---

## Deploy cluster:
```gcloud deployment-manager deployments create name-of-cluster --config ./cluster/cluster.yaml```

## Update cluster:
```gcloud deployment-manager deployments update name-of-cluster --config ./cluster/cluster.yaml```

## Delete cluster:
```gcloud deployment-manager deployments delete name-of-cluster```

---

## Deploy application:
```gcloud deployment-manager deployments create name-of-deployment --config ./deployment/deployment.yaml```

## Update application:
```gcloud deployment-manager deployments update name-of-deployment --config ./deployment/deployment.yaml```

## Delete application:
```gcloud deployment-manager deployments delete name-of-deployment```

---

## Portforward localhost:8080 to application:8080
Such that the application may be easily accessed.
```
gcloud container clusters get-credentials cluster-ultron --zone europe-west1-b --project name-of-project \
&& kubectl port-forward $(kubectl get pod --selector="app=app-thanos" --output jsonpath='{.items[0].metadata.name}') 8080:8080
```

Replace *thanos* if the name of the deployment is replaced.

---

## Get kubectl
```gcloud container clusters get-credentials name-of-cluster --zone my-zone --project name-of-project```