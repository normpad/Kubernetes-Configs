helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install --create-namespace -n prometheus prometheus prometheus-community/kube-prometheus-stack