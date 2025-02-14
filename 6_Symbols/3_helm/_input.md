# 🚀 Installing EDB Postgres for Kubernetes (PG4K)

## Prerequisites Check 🔍
First, let's ensure Minikube is fresh and running:

```bash
minikube delete
minikube start
kubectl get nodes
```

## Adding EDB Helm Repository 📦
Let's add the EDB Helm repository:

```bash
helm repo add edb https://enterprisedb.github.io/edb-postgres-for-kubernetes-charts/
```

## Installing EDB Operator 🛠️
Deploy the EDB Postgres for Kubernetes Operator:

```bash
helm upgrade --install edb-pg4k \
    --namespace postgresql-operator-system \
    --create-namespace \
    --set image.imageCredentials.username=k8s_enterprise \
    --set image.imageCredentials.password=<your_token> \
    edb/edb-postgres-for-kubernetes
```

> /workspaces/EdbApache/6_Symbols/3_helm/_install_withtoken.md

⚠️ **Important**: Replace `<your_token>` with your actual EDB token. You can get this from your EnterpriseDB account.

## Setting Up Your Working Environment 🔧
Let's switch to the PostgreSQL operator namespace for easier management:

```bash
kubectl config set-context --current --namespace=postgresql-operator-system
```

## Verification Steps 🔍

Check if the operator is running:
```bash
kubectl get deployments
kubectl get pods
```

## Deploying a Sample Cluster 🗄️
Let's create a sample PostgreSQL cluster:

```bash
kubectl apply -f /workspaces/EdbApache/6_Symbols/3_helm/single_instance_cluster.yaml
```

Verify the cluster deployment:
```bash
kubectl get pods
```

## Accessing Your Database 🔌
To connect to your database locally:

```bash
# Replace <service-name> with your actual service name
kubectl port-forward svc/<service-name> 5432:5432
kubectl port-forward svc/single-instance-cluster-rw 5432:5432

   
```

## Troubleshooting Tips 🔧

If you encounter issues:
1. Check pod status: `kubectl get pods`
2. View pod logs: `kubectl logs <pod-name>`
3. Describe pod details: `kubectl describe pod <pod-name>`

Would you like me to elaborate on any of these steps or help you troubleshoot any specific issues? 🤔

prompt: 
- install the edb with the operator for the enterprise db
- install on codespaces
- use emojis
- use markdown