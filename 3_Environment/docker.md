@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ minikube delete
🔥  Deleting "minikube" in docker ...
🔥  Deleting container "minikube" ...
🔥  Removing /home/codespace/.minikube/machines/minikube ...
💀  Removed all traces of the "minikube" cluster.
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ minikube start
😄  minikube v1.34.0 on Ubuntu 20.04 (docker/amd64)
    ▪ MINIKUBE_ACTIVE_DOCKERD=minikube
✨  Automatically selected the docker driver. Other choices: none, ssh
📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.45 ...
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ eval $(minikube -p minikube docker-env)
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ kubectl create secret docker-registry edb-registry-secret --docker-server=docker.enterprisedb.com --docker-username=k8s_enterprise_pgd --docker-password=jeDm3hBgXOIufKSZK69iAht6ZZXAn4OA --docker-email=info@pexabo.com
secret/edb-registry-secret created
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ docker login docker.enterprisedb.com
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/codespace/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credential-stores

Login Succeeded
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ cd /workspaces/EdbApache/6_Symbols/2_setupDocker/
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setupDocker (main) $ kubectl apply -f apache-deployment.yaml
deployment.apps/apache-deployment created
service/apache-service created
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setupDocker (main) $ kubectl apply -f edb-deployment.yaml
deployment.apps/edb-deployment created
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setupDocker (main) $ kubectl get pods
NAME                                 READY   STATUS              RESTARTS   AGE
apache-deployment-54984cdb98-jzsjp   0/1     ContainerCreating   0          13s
edb-deployment-75b4764fcb-nrb22      0/1     ContainerCreating   0          6s
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setupDocker (main) $ kubectl get pods
NAME                                 READY   STATUS              RESTARTS   AGE
apache-deployment-54984cdb98-jzsjp   0/1     ContainerCreating   0          16s
edb-deployment-75b4764fcb-nrb22      0/1     ContainerCreating   0          9s
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setupDocker (main) $ kubectl get pods
NAME                                 READY   STATUS              RESTARTS   AGE
apache-deployment-54984cdb98-jzsjp   0/1     ContainerCreating   0          18s
edb-deployment-75b4764fcb-nrb22      0/1     ContainerCreating   0          11s
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setupDocker (main) $ 