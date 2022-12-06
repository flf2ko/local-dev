k8s:
	# KIND_EXPERIMENTAL_DOCKER_NETWORK=host kind create cluster --config kind/k8s-dev.yaml
	# brew install kind
	kind create cluster --config kind/k8s-dev.yaml

cilium:
	# brew install cilium-cli
	cilium install

cilium-test:
	cilium connectivity test

# You have to deploy twice. First time is for CRD
argocd:
	kubectl apply -k manifests/argocd

# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
ingress:
	kubectl apply -k manifests/ingress-nginx

# https://github.com/nginxinc/nginx-kubernetes-gateway/blob/main/docs/installation.md
nginx-gateway:
	kubectl apply -k manifests/nginx-gateway

nginx-gateway-usage:
	kubectl apply -k manifests/nginx-gateway/example

coroot:
	kubectl apply -f https://raw.githubusercontent.com/coroot/coroot/main/manifests/coroot.yaml

ingress-usage:
	# kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml
	kubectl apply -f usage.yaml

all: k8s cilium ingress coroot

del:
	kind delete clusters k8s-dev
