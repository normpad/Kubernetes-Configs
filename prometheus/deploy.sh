export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install --create-namespace -n prometheus prometheus prometheus-community/kube-prometheus-stack