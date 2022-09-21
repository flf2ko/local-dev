k8s:
	kind create cluster

cilium:
	cilium install

ingress:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

all: k8s cilium ingress