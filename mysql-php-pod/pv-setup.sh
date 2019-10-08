kubectl apply -f mysql-pv.yaml
kubectl apply -f mysql-pv-claim.yaml
kubectl get pv -o wide
kubectl get pvc -o wide
