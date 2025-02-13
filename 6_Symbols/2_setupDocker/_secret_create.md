
kubectl create secret docker-registry edb-registry-secret --docker-server=docker.enterprisedb.com --docker-username=k8s_enterprise_pgd --docker-password=jeDm3hBgXOIufKSZK69iAht6ZZXAn4OA --docker-email=info@pexabo.com

docker login docker.enterprisedb.com


@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ docker login docker.enterprisedb.com
Username: k8s_enterprise_pgd
Password: 
WARNING! Your password will be stored unencrypted in /home/codespace/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credential-stores

Login Succeeded
@rifaterdemsahin ➜ /workspaces/EdbApache/6_Symbols/2_setup (main) $ 