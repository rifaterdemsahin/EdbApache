🚀 **Minikube Commands:**
```bash
minikube delete
minikube start
eval $(minikube -p minikube docker-env)
```

🔒 **Gitignored Secrets:**
- `/workspaces/EdbApache/6_Symbols/2_setupDocker/_secret_create.md`

🔒 **Gitignored DockerLogin:**
- `/workspaces/EdbApache/6_Symbols/2_setupDocker/_secret_create.md`

📦 **Deployments:**
cd /workspaces/EdbApache/6_Symbols/2_setupDocker/
```bash
kubectl apply -f apache-deployment.yaml
kubectl apply -f edb-deployment.yaml
```

🔍 **Check Pods:**
```bash
kubectl get pods
```

🔗 **Port Forwarding:**
```bash
kubectl port-forward deployment/apache-deployment 8080:80
kubectl port-forward deployment/edb-deployment 5444:5444
```

🔑 **Create Docker Registry Secret:**
```bash
kubectl create secret docker-registry edb-registry-secret --docker-server=docker.enterprisedb.com --docker-username=<your-username> --docker-password=<your-token> --docker-email=<your-email>
```

🌐 **Browse:**
- Apache: [https://sturdy-rotary-phone-46vx5p9g6ph7qjq-8080.app.github.dev/](https://sturdy-rotary-phone-46vx5p9g6ph7qjq-8080.app.github.dev/)
