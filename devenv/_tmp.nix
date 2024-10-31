{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  env.CLUSTER_NAME = clusterName;
  env.CLUSTER_DOMAIN = "${clusterName}.local.tedatech.app";
  env.KUBERNETES_NODE_IMAGE = "kindest/node:v1.30.4";
  env.CROSSPLANE_VERSION = "1.17.0";
  env.DOCKER_REGISTRY_VERSION = "2.2.3";

  packages = [
    pkgs.git
    pkgs.jq
    pkgs.docker
    pkgs.kind
    pkgs.kubectl
    pkgs.k9s
    pkgs.kuttl
    pkgs.skaffold
    pkgs.tektoncd-cli
    pkgs.crossplane-cli
  ];

  languages = {
    opentofu.enable = true;
  };

  scripts.envclean.exec = "kind delete clusters ${clusterName} --force; rm -Rf ${config.env.DEVENV_ROOT}/opentofu/*.tfstate";
  scripts.envready.exec = "kubectl wait --for condition=available --timeout=300s deployment/crossplane deployment/registry-docker-registry";
  scripts.envstart.exec = ''
    (kind get clusters | grep -q ${clusterName} || kind create cluster --name ${clusterName} --image $KUBERNETES_NODE_IMAGE) && \
    kubectl config use-context kind-${clusterName} && \
    (kubectl get namespace crossplane-system &>/dev/null || kubectl create namespace crossplane-system) && \
    helm upgrade --install crossplane --namespace crossplane-system https://charts.crossplane.io/stable/crossplane-$CROSSPLANE_VERSION.tgz && \
    helm upgrade --install registry --namespace crossplane-system https://helm.twun.io/docker-registry-$DOCKER_REGISTRY_VERSION.tgz && \
    envready
  '';
}
