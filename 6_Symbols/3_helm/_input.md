minikube delete
minikube start
 kubectl get nodes

### Step 2: Install kubectl 🖥️
1. **Download and install kubectl**:
   - Follow the official kubectl installation guide for your operating system.

2. **Verify kubectl installation**:
   ```bash
   kubectl version --client
   ```
   - This command should display the version of kubectl installed.


   Already have kubectl installed. Unecessary.

### Step 3: Deploy EDB Postgres 🚀
1. **Download repo for EDB for Helm**
    '''
    helm repo add edb https://enterprisedb.github.io/edb-postgres-for-kubernetes-charts/'''

Deploy EDB Postgres for Kubernetes Operator (PG4K) 🐘
helm upgrade --install edb-pg4k \
  --namespace postgresql-operator-system \
  --create-namespace \
  --set image.imageCredentials.username=k8s_enterprise \
Yes, you need to use your EDB account credentials for the image credentials. Here is the updated section:

```bash
helm upgrade --install edb-pg4k \
    --namespace postgresql-operator-system \
    --create-namespace \
    --set image.imageCredentials.username=<YOUR-EDB-USERNAME> \
    --set image.imageCredentials.password=<YOUR-EDB-PASSWORD> \
    edb/edb-postgres-for-kubernetes
```

To find your EDB username, log in to your EnterpriseDB account on the [EnterpriseDB website](https://www.enterprisedb.com/). Your username is typically the email address you used to register for the account.
Verify the deployment:
kubectl get deployments -n postgresql-operator-system
You should see edb-pg4k-edb-postgres-for-kubernetes with READY status.

Yes, if you plan to work extensively in the `postgresql-operator-system` namespace, it is a good idea to switch your Kubernetes context to this namespace. This will save you from having to specify the namespace in every `kubectl` command.

You can switch the context to the `postgresql-operator-system` namespace using the following command:

```bash
kubectl config set-context --current --namespace=postgresql-operator-system
```

This command sets the default namespace for the current context to `postgresql-operator-system`. After running this command, you can run `kubectl` commands without specifying the namespace explicitly.

For example, instead of running:

```bash
kubectl get pods -n postgresql-operator-system
```

You can simply run:

```bash
kubectl get pods
```

This will make your workflow more efficient when working within the `postgresql-operator-system` namespace.

3. **Verify the deployment**:
   ```bash
   kubectl get pods
   ```
   - You should see pods related to EDB Postgres running.
### Step 4: Access EDB Postgres 📡
1. **Verify the service is running**:
    ```bash
    kubectl get svc -n postgresql-operator-system
    ```
    - You should see a service related to your EDB Postgres deployment.

2. **Forward a port to access the database**:
    ```bash
    kubectl port-forward svc/<service-name> 5432:5432 -n postgresql-operator-system
    ```
    - Replace `<service-name>` with the name of your EDB Postgres service. This command will forward port 5432 from the service to your local machine.


I am able to see deployments and service and pods running, but since I did helm repo add, I don't like to feeling of not being able to see our values.yaml file. 

When we do helm repo add, it does not download chart files to local machine. But it fetches the index file that lists the available charts. 

Use the helm pull command to download the chart:

helm pull edb/edb-postgres-for-kubernetes --untar


now I have the values and charts file for this.

At this point, I am pretty confused because they have multiple offerings.

To set up EDB Postgres on your Minikube cluster with the minimum requirements, you can focus on deploying the EDB Postgres for Kubernetes operator (PG4K). Here are the simplified steps:

Step-by-Step Guide to Set Up EDB Postgres on Minikube
1. Install Minikube and kubectl 🛠️
Minikube: Follow the Minikube installation guide for your operating system.
kubectl: Follow the kubectl installation guide for your operating system.
2. Start Minikube 🚀
minikube start
Verify Minikube is running:
kubectl get nodes
You should see a node named minikube.

3. Add the EDB Helm Repository 📦
helm repo add edb https://enterprisedb.github.io/edb-postgres-for-kubernetes-charts/
helm repo update
4. Obtain EDB Subscription Token 🔑
You need an EDB subscription token to pull images from the EDB private repositories. You can obtain this by subscribing to an EDB plan or using a free trial.
5. Deploy EDB Postgres for Kubernetes Operator (PG4K) 🐘
helm upgrade --install edb-pg4k \
  --namespace postgresql-operator-system \
  --create-namespace \
  --set image.imageCredentials.username=k8s_enterprise \
  --set image.imageCredentials.password=<YOUR-TOKEN> \
  edb/edb-postgres-for-kubernetes
Verify the deployment:
kubectl get deployments -n postgresql-operator-system
You should see edb-pg4k-edb-postgres-for-kubernetes with READY status.

6. Deploy a Sample Cluster 📊
Create a sample cluster using the provided Helm chart:
kubectl apply -f https://raw.githubusercontent.com/EnterpriseDB/edb-k8s-docs/main/examples/cluster-example.yaml
Verify the cluster:
kubectl get pods -n postgresql-operator-system
You should see pods related to your EDB Postgres cluster running.


prompt: install the edb with the operator for the enterprise db