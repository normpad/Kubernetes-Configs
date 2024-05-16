kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.4/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm install --create-namespace cert-manager --namespace cert-manager --version v1.12.4 jetstack/cert-manager