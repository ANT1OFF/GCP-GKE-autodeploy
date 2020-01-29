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



## Deploy application:
```gcloud deployment-manager deployments create name-of-deployment --config ./deployment/deployment.yaml```

## Delete application:
```gcloud deployment-manager deployments delete name-of-deployment```

---

## Get kubectl
```gcloud container clusters get-credentials name-of-cluster --zone my-zone --project name-of-project```