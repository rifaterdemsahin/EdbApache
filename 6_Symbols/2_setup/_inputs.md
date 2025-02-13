minikube start
kubectl apply -f apache-deployment.yaml
kubectl apply -f edb-deployment.yaml
kubectl port-forward deployment/apache-deployment 8080:80
kubectl create secret docker-registry edb-registry-secret --docker-server=docker.enterprisedb.com --docker-username=<your-username> --docker-password=<your-token> --docker-email=<your-email>

kubectl port-forward deployment/edb-deployment 5444:5444
Browse -> apache > https://sturdy-rotary-phone-46vx5p9g6ph7qjq-8080.app.github.dev/
