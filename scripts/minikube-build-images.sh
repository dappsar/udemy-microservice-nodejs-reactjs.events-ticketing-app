eval $(minikube docker-env)
minikube addons enable registry
kubectl port-forward --namespace kube-system service/registry 5000:80
cd auth; docker build -t localhost:5000/auth .; docker push localhost:5000/auth; cd ..
cd client; docker build -t localhost:5000/client .; docker push localhost:5000/client; cd ..
cd tickets; docker build -t localhost:5000/tickets .; docker push localhost:5000/tickets; cd ..

# In order to make docker accept pushing images to this registry, we have to redirect port 5000 on the docker virtual machine over to port 80 on the minikube registry service. Unfortunately, the docker vm cannot directly see the IP address of the minikube vm. To fix this, you will have to add one more level of redirection.
# Use kubectl port-forward to map your local workstation to the minikube vm: kubectl port-forward --namespace kube-system service/registry 5000:80
# More info: https://minikube.sigs.k8s.io/docs/handbook/registry/
