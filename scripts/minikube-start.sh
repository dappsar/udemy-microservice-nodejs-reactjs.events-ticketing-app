  minikube start
  minikube addons enable registry
  minikube addons enable ingress
  minikube addons enable dashboard
  eval $(minikube docker-env)
  kubectl port-forward --namespace kube-system service/registry 5000:80 &
  # Note: You have to run eval $(minikube docker-env) on each terminal you want to use, since it only sets the environment variables for the current shell session
  
  # In order to make docker accept pushing images to this registry, we have to redirect port 5000 on the docker virtual machine over to port 80 on the minikube registry service. Unfortunately, the docker vm cannot directly see the IP address of the minikube vm. To fix this, you will have to add one more level of redirection.
  # Use kubectl port-forward to map your local workstation to the minikube vm: kubectl port-forward --namespace kube-system service/registry 5000:80
  # More info: https://minikube.sigs.k8s.io/docs/handbook/registry/
