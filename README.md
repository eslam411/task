## Build and Run Locally

To build the container image and run it locally using Podman:

```bash
podman build --platform linux/x86_64 -t pwcacr12345unique.azurecr.io/microservicedemo:1 . && podman run -p 5000:5000 microservice-demo:1
```

After running this command, the service will be available at `http://localhost:5000`.

---

## Deploy Infrastructure with Terraform

Run the following Terraform commands to set up the Azure Kubernetes Service (AKS) cluster and related resources:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

These commands will initialize Terraform, check the configuration, create a plan, and then apply it to provision resources in Azure.

---

## Configure kubectl

Once Terraform finishes, export the kubeconfig to interact with the AKS cluster:

```bash
terraform output -raw kube_config > ./aks-kube_config
export KUBECONFIG=$PWD/aks-kube_config
```

If you want this to be permanent, you can add the export command to your `~/.bashrc`, or you can replace your global kubeconfig file at `~/.kube/config`.

---

## Retrieve Grafana Password

The Grafana password is stored in a Kubernetes Secret. Use the following command to retrieve and decode it:

```bash
terraform output -raw grafana_admin_password
```

---

## Access Grafana in the Browser

Grafana is exposed through a Kubernetes LoadBalancer service. To find the external IP, run:

```bash
kubectl get svc prometheus-grafana -n monitoring 
```

Log in with the username `admin` and the password you retrieved earlier.

---

## Deploy the Application Manually

If you want to deploy the app without automation, you can do so manually:

```bash
kubectl create ns python-ns
kubectl apply -f deploy.yaml
```
