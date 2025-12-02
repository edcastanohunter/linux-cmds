## Kubernetes

k3d is a tool to create kubernetes clusters. As an alternative minikube can be used.
https://k3d.io/stable/#install-specific-release

```bash

k3d version 

# Se expone el puerto 8089 para que pueda acceder desde el navegador
k3d cluster create demo --port 8089:80@loadbalancer

# Ver los clusters
k3d cluster list

# Eliminar el cluster
k3d cluster delete demo
```

### Instalar postgres en el cluster
https://helm.sh/docs/intro/install/
```bash
#
helm repo add bitnami https://charts.bitnami.com/bitnami


# Instalar PostgreSQL con Helm
helm install postgres bitnami/postgresql \
--set auth.username=n8n \
--set auth.password="miclave" \
--set auth.database=n8n \
--set auth.postgresPassword=postgresadmin \
--set primary.persistence.size=5Gi \
--set primary.persistence.storageClass=local-path

export POSTGRES_ADMIN_PASSWORD=$(kubectl get secret --namespace default postgres-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)

To get the password for "n8n" run:

    export POSTGRES_PASSWORD=$(kubectl get secret --namespace default postgres-postgresql -o jsonpath="{.data.password}" | base64 -d)
    
# Verificar estado de pods
# a) kubectl get pods
# b) kubectl logs -f 


# Instalar redis
helm install redis bitnami/redis \
--set primary.persistence.size=5Gi \
--set primary.persistence.storageClass=local-path \
--set primary.service.port=6379

# Redis&reg; can be accessed on the following DNS names from within your cluster:

#     redis-master.default.svc.cluster.local for read/write operations (port 6379)
#     redis-replicas.default.svc.cluster.local for read-only operations (port 6379)



# To get your password run:

#     export REDIS_PASSWORD=$(kubectl get secret --namespace default redis -o jsonpath="{.data.redis-password}" | base64 -d)

# To connect to your Redis&reg; server:

# 1. Run a Redis&reg; pod that you can use as a client:

#    kubectl run --namespace default redis-client --restart='Never'  --env REDIS_PASSWORD=$REDIS_PASSWORD  --image registry-1.docker.io/bitnami/redis:latest --command -- sleep infinity

#    Use the following command to attach to the pod:

#    kubectl exec --tty -i redis-client \
#    --namespace default -- bash

# 2. Connect using the Redis&reg; CLI:
#    REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h redis-master
#    REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h redis-replicas

helm uninstall postgres
helm uninstall redis

kubectl apply -f configmap-n8n.yml
kubectl apply -f pvc-n8n-data.yaml
kubectl apply -f service-n8n-main.yaml
kubectl apply -f deployment-n8n-main.yaml
kubectl apply -f deployment-n8n-worker.yaml
kubectl apply -f ingress-n8n-localhost.yaml 

```



