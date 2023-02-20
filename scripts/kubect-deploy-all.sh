kubectl port-forward --namespace kube-system service/registry 5000:80 &
kubectl delete -f ../infra/k8s/
kubectl apply -f ../infra/k8s/
minikube dashboard &