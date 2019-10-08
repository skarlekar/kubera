docker login
kubectl apply -f mysql-php-deployment.yaml
kubectl apply -f mysql-php-service.yaml
kubectl apply -f mysql-php-ingress.yaml

kubectl get ingress
