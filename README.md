# GCP Project

## Requirements:

- The Application to be dockerized and pushed to GCR is on here: [Code](https://github.com/atefhares/DevOps-Challenge-Demo-Code)
- Provision infrastructure on GCP with Terraform Consist of:
  - VPC with two subnets:
    - Management subnet has:
      - Private VM.
      - NAT gateway.
    - Restricted subnet has:
      - Private standard GKE cluster.
- Deploy the application on the GKE cluster.
- Deployment must be exposed to public internet with a public HTTP load balancer.

## Description:

- Restricted subnet must not have access to internet.
- The VM must be private.
- Deployment on GKE manually by kubectl tool.
- Only the management subnet can connect to the GKE cluster.
- Useing custom SA not the default one and attach it to our of GKE cluster nodes.

# Steps:    

## Dockerize Python Web App from [DevOps-Challenge-Demo-Code](https://github.com/atefhares/DevOps-Challenge-Demo-Code)

- Dockerfile [Click here](https://github.com/Magdi888/GCP-Project/blob/master/App/Dockerfile)
- Authenticate to push images to GCR
 ```
   gcloud auth configure-docker
 ```
- Build image and tag it with gcr hostname and tag redis image with the same hostname and push them.
 ```
   docker build -t us.gcr.io/durable-spot-354112/webapp
   docker tag redis:5.0-alpine us.gcr.io/durable-spot-354112/redis
   docker push us.gcr.io/durable-spot-354112/webapp
   docker push us.gcr.io/durable-spot-354112/redis
 ```
## Provision infrastructure on GCP with Terraform.

- Create Bucket to save Terraform state file.
- Set the bucket name in backend.tf file.
- Run the following:
 ```
  # Initialization terraform
   terraform init
  # Show our Plan
   terraform plan --var-file dev.tfvars
  # Create Dev Workspace
   terraform workspace new dev
  # Select Dev Workspace
   terraform workspace select dev
  # Apply Our Plan
   terraform apply --var-file dev.tfvars
 ```
### Infrastructure
![Untitled Diagram-Page-1](https://user-images.githubusercontent.com/91858017/180895752-124e12ca-59be-45e2-828f-b6d03ed41856.jpg)
- Connect to Private VM with ssh.
 ```
   gcloud compute ssh [machine name]
 ```
- Updates a kubeconfig file with appropriate credentials and endpoint information to point kubectl at a our cluster in Google Kubernetes Engine.
 ```
  gcloud container clusters get-credentials [GKE name] --zone [used zone] --project [ProjectId]
 ```
## Deploying Our App on [K8s resources](https://github.com/Magdi888/GCP-Project/tree/master/K8s_resources)
- Copy K8s_resources directory to VM
- Run command:
 ```
  kubectl create namespace dev
  kubectl apply -Rf ./K8s_resources -n dev
 ```
### Web App Structure
![Untitled Diagram-Page-2 drawio (1)](https://user-images.githubusercontent.com/91858017/180895495-b349a142-4c8a-4f17-96d6-7b0464400202.png)
- Get Web App IP
 ```
  kubectl get ingress
 ```
 ![image](https://user-images.githubusercontent.com/91858017/180893839-4b21f18e-750b-4e5d-a6a9-d9cee54701e0.png)

- Visit Ingress Address:Port [34.110.182.92:80]

 ![image](https://user-images.githubusercontent.com/91858017/180894183-abd569d1-3907-4f2a-922e-350d6584deb8.png)
 
 


 
