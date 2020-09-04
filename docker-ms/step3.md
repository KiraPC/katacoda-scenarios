## Start Kubernetes

Now that we developed and tested the Docker image, we can deploy it on Kubernetes.

First of all, we have to start the minikube istance.

Minikube is a tool that makes it easy to run Kubernetes locally. 
Minikube runs a single-node Kubernetes cluster inside a Virtual Machine (VM) on your laptop (in this case on Katacoda instance).

So, execute the command:

`minikube start`{{execute}}

## Create the deployment

To deploy a microservice on Kubernetes, we need to define a configuration file in yaml or json, that describe the container to create.

You can fine this file already defined in the folder 'server-hello/infra' with the name 'deployment.yml'.

`cd /root/server-hello/infra`{{execute}}

Let's create the deployment

`kubectl create -f deployment.yml`{{execute}}

## Check the pods status

In the deployment, we tell to Kubernetes to create one container, 'server-hello-container'. 

A container in kubernetes runs on a 'pod'.

Let's check if it was correctly created.

`kubectl get pods`{{execute}}

If you can see a pod with the name 'server-hello-container-*****' and status Running, ererything were fine.

## Query the pod

As we already did with the docker image, we will now query the running container to check its response.

To contact the service running on Kubernets, we need to find the port where it is listening.

```
export PORT=$(kubectl get services | grep server-hello-container* | awk '{print $5}' | cut -b 4-8)
echo $PORT
```

Now the we have the port, we can query it, replacing the PORT in the following URL.

You can do it just clicking on this:

`echo https://[[HOST_SUBDOMAIN]]-$PORT-[[KATACODA_HOST]].environments.katacoda.com/api/hello`{{execute}}

Copy and paste the result of this command on your browser.

Congrats, you deployed a microservice on Kubernetes.