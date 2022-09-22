k8s:
	# KIND_EXPERIMENTAL_DOCKER_NETWORK=host kind create cluster --config kind/k8s-dev.yaml
	kind create cluster --config kind/k8s-dev.yaml

cilium:
	cilium install

cilium-test:
	cilium connectivity test

ingress:
	# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	kubectl apply -k manifests/ingress

coroot:
	kubectl apply -f https://raw.githubusercontent.com/coroot/coroot/main/manifests/coroot.yaml

ingress-usage:
	kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml

all: k8s cilium ingress coroot

del:
	kind delete clusters k8s-dev