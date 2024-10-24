{ pkgs, lib, config, inputs, ... }:
let
  clusterName = builtins.hashString "md5" config.env.DEVENV_ROOT;
in
{
  dotenv.enable = true;

  packages = [
    pkgs.git
    pkgs.jq
    pkgs.kind
    pkgs.kubectl
    pkgs.k9s
    pkgs.kyverno-chainsaw
    pkgs.just
    pkgs.watchexec
    pkgs.tektoncd-cli
    pkgs.crossplane-cli
    pkgs.mkcert
    pkgs.cilium-cli
    pkgs.fluxcd
    pkgs.kubeconform
    pkgs.yamllint
  ];

  pre-commit.hooks = {
    lint-yaml = {
      enable = true;
      name = "lint yaml";
      entry = "just lint-yaml";
      files = "\\.(yaml|yml)$";
    };
  };  
}
